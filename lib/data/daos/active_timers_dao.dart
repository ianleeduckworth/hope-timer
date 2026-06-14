import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables/active_timers.dart';
import '../tables/published_timers.dart';
import '../../utils/timer_elapsed.dart';

part 'active_timers_dao.g.dart';

const _uuid = Uuid();
const _hourMs = 3600000;

@DriftAccessor(tables: [ActiveTimers, PublishedTimers])
class ActiveTimersDao extends DatabaseAccessor<AppDatabase>
    with _$ActiveTimersDaoMixin {
  ActiveTimersDao(super.db);

  Stream<List<ActiveTimer>> watchAll() {
    return (select(activeTimers)
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .watch();
  }

  Future<void> createTimer() async {
    final now = DateTime.now();
    await into(activeTimers).insert(
      ActiveTimersCompanion.insert(
        id: _uuid.v4(),
        projectName: '',
        elapsedMs: 0,
        isRunning: false,
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> updateProjectName(String id, String projectName) async {
    await (update(activeTimers)..where((t) => t.id.equals(id))).write(
      ActiveTimersCompanion(
        projectName: Value(projectName),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> play(String id) async {
    final timer = await _getTimer(id);
    if (timer.isRunning) {
      return;
    }

    await (update(activeTimers)..where((t) => t.id.equals(id))).write(
      ActiveTimersCompanion(
        isRunning: const Value(true),
        runningSince: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> pause(String id) async {
    final timer = await _getTimer(id);
    if (!timer.isRunning) {
      return;
    }

    final elapsedMs = computeElapsedMs(timer);
    await (update(activeTimers)..where((t) => t.id.equals(id))).write(
      ActiveTimersCompanion(
        elapsedMs: Value(elapsedMs),
        isRunning: const Value(false),
        runningSince: const Value(null),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> addHour(String id) async {
    await _adjustElapsed(id, _hourMs);
  }

  Future<void> removeHour(String id) async {
    await _adjustElapsed(id, -_hourMs);
  }

  Future<void> resetTo(String id, int targetMs) async {
    final timer = await _getTimer(id);
    final wasRunning = timer.isRunning;
    if (wasRunning) {
      await pause(id);
    }

    await (update(activeTimers)..where((t) => t.id.equals(id))).write(
      ActiveTimersCompanion(
        elapsedMs: Value(targetMs < 0 ? 0 : targetMs),
        isRunning: const Value(false),
        runningSince: const Value(null),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (wasRunning) {
      await play(id);
    }
  }

  Future<void> deleteTimer(String id) async {
    await (delete(activeTimers)..where((t) => t.id.equals(id))).go();
  }

  Future<void> publish(String id) async {
    await transaction(() async {
      final timer = await _getTimer(id);
      final durationMs = computeElapsedMs(timer);
      final projectName = timer.projectName;
      final now = DateTime.now();

      await into(publishedTimers).insert(
        PublishedTimersCompanion.insert(
          id: _uuid.v4(),
          projectName: projectName,
          durationMs: durationMs,
          publishedAt: now,
        ),
      );

      await (delete(activeTimers)..where((t) => t.id.equals(id))).go();

      await into(activeTimers).insert(
        ActiveTimersCompanion.insert(
          id: _uuid.v4(),
          projectName: projectName,
          elapsedMs: 0,
          isRunning: false,
          createdAt: now,
          updatedAt: now,
        ),
      );
    });
  }

  Future<void> _adjustElapsed(String id, int deltaMs) async {
    final timer = await _getTimer(id);
    final wasRunning = timer.isRunning;
    if (wasRunning) {
      await pause(id);
    }

    final current = computeElapsedMs(timer);
    final next = (current + deltaMs).clamp(0, 1 << 62);

    await (update(activeTimers)..where((t) => t.id.equals(id))).write(
      ActiveTimersCompanion(
        elapsedMs: Value(next),
        isRunning: const Value(false),
        runningSince: const Value(null),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (wasRunning) {
      await play(id);
    }
  }

  Future<ActiveTimer> _getTimer(String id) {
    return (select(activeTimers)..where((t) => t.id.equals(id))).getSingle();
  }
}
