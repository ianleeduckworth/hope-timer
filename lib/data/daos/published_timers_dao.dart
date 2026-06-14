import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/published_timers.dart';

part 'published_timers_dao.g.dart';

@DriftAccessor(tables: [PublishedTimers])
class PublishedTimersDao extends DatabaseAccessor<AppDatabase>
    with _$PublishedTimersDaoMixin {
  PublishedTimersDao(super.db);

  Stream<List<PublishedTimer>> watchAll() {
    return (select(publishedTimers)
          ..orderBy([(t) => OrderingTerm.desc(t.publishedAt)]))
        .watch();
  }

  Future<void> deleteTimer(String id) async {
    await (delete(publishedTimers)..where((t) => t.id.equals(id))).go();
  }
}
