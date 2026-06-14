import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/daos/active_timers_dao.dart';
import '../data/daos/analytics_dao.dart';
import '../data/daos/published_timers_dao.dart';
import '../data/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final activeTimersDaoProvider = Provider<ActiveTimersDao>((ref) {
  return ref.watch(databaseProvider).activeTimersDao;
});

final publishedTimersDaoProvider = Provider<PublishedTimersDao>((ref) {
  return ref.watch(databaseProvider).publishedTimersDao;
});

final analyticsDaoProvider = Provider<AnalyticsDao>((ref) {
  return ref.watch(databaseProvider).analyticsDao;
});
