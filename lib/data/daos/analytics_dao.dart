import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

import '../database.dart';
import '../tables/published_timers.dart';
import '../../utils/project_name.dart';

part 'analytics_dao.g.dart';

enum AnalyticsPeriod { day, week, month }

class AnalyticsRow {
  const AnalyticsRow({
    required this.projectName,
    required this.periodLabel,
    required this.totalMs,
  });

  final String projectName;
  final String periodLabel;
  final int totalMs;
}

@DriftAccessor(tables: [PublishedTimers])
class AnalyticsDao extends DatabaseAccessor<AppDatabase>
    with _$AnalyticsDaoMixin {
  AnalyticsDao(super.db);

  Future<List<AnalyticsRow>> getAnalytics(AnalyticsPeriod period) async {
    final timers = await (select(publishedTimers)
          ..orderBy([(t) => OrderingTerm.desc(t.publishedAt)]))
        .get();

    final grouped = <String, _AnalyticsAccumulator>{};

    for (final timer in timers) {
      final bucketKey = _bucketKey(period, timer.publishedAt);
      final normalized = normalizeProjectName(timer.projectName);
      final key = '$normalized|$bucketKey';

      grouped.putIfAbsent(
        key,
        () => _AnalyticsAccumulator(
          projectName: timer.projectName,
          periodLabel: _formatPeriodLabel(period, timer.publishedAt),
        ),
      );

      final entry = grouped[key]!;
      entry.totalMs += timer.durationMs;
      entry.projectName = timer.projectName;
    }

    final rows = grouped.values
        .map(
          (entry) => AnalyticsRow(
            projectName: displayProjectName(entry.projectName),
            periodLabel: entry.periodLabel,
            totalMs: entry.totalMs,
          ),
        )
        .toList()
      ..sort((a, b) {
        final periodCompare = b.periodLabel.compareTo(a.periodLabel);
        if (periodCompare != 0) {
          return periodCompare;
        }
        return a.projectName.toLowerCase().compareTo(
          b.projectName.toLowerCase(),
        );
      });

    return rows;
  }

  String _bucketKey(AnalyticsPeriod period, DateTime publishedAt) {
    final local = publishedAt.toLocal();
    switch (period) {
      case AnalyticsPeriod.day:
        return DateFormat('yyyy-MM-dd').format(local);
      case AnalyticsPeriod.week:
        final weekYear = _isoWeekYear(local);
        final weekNumber = _isoWeekNumber(local);
        return '$weekYear-W${weekNumber.toString().padLeft(2, '0')}';
      case AnalyticsPeriod.month:
        return DateFormat('yyyy-MM').format(local);
    }
  }

  String _formatPeriodLabel(AnalyticsPeriod period, DateTime publishedAt) {
    final local = publishedAt.toLocal();
    switch (period) {
      case AnalyticsPeriod.day:
        return DateFormat.yMMMd().format(local);
      case AnalyticsPeriod.week:
        final weekYear = _isoWeekYear(local);
        final weekNumber = _isoWeekNumber(local);
        return 'Week $weekNumber, $weekYear';
      case AnalyticsPeriod.month:
        return DateFormat.yMMMM().format(local);
    }
  }

  int _isoWeekNumber(DateTime date) {
    final thursday = date.add(Duration(days: 4 - date.weekday));
    final yearStart = DateTime(thursday.year, 1, 1);
    return 1 + (thursday.difference(yearStart).inDays / 7).floor();
  }

  int _isoWeekYear(DateTime date) {
    final thursday = date.add(Duration(days: 4 - date.weekday));
    return thursday.year;
  }
}

class _AnalyticsAccumulator {
  _AnalyticsAccumulator({
    required this.projectName,
    required this.periodLabel,
  });

  String projectName;
  final String periodLabel;
  int totalMs = 0;
}
