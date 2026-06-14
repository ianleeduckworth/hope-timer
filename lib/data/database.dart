import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'daos/active_timers_dao.dart';
import 'daos/analytics_dao.dart';
import 'daos/published_timers_dao.dart';
import 'tables/active_timers.dart';
import 'tables/published_timers.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [ActiveTimers, PublishedTimers],
  daos: [ActiveTimersDao, PublishedTimersDao, AnalyticsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'hope_timer');
  }
}
