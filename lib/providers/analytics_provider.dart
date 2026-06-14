import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/daos/analytics_dao.dart';
import '../data/database.dart';
import 'active_timers_provider.dart';
import 'database_provider.dart';
import 'published_timers_provider.dart';

final analyticsPeriodProvider = StateProvider<AnalyticsPeriod>(
  (ref) => AnalyticsPeriod.day,
);

final analyticsProvider = FutureProvider<List<AnalyticsRow>>((ref) async {
  ref.watch(publishedTimersProvider);
  final period = ref.watch(analyticsPeriodProvider);
  return ref.watch(analyticsDaoProvider).getAnalytics(period);
});

final timerTickProvider = StateNotifierProvider<TimerTickNotifier, DateTime>(
  TimerTickNotifier.new,
);

class TimerTickNotifier extends StateNotifier<DateTime> {
  TimerTickNotifier(this._ref) : super(DateTime.now()) {
    _ref.listen(activeTimersProvider, (_, next) {
      next.whenData(_syncTicker);
    }, fireImmediately: true);
  }

  final Ref _ref;
  Timer? _timer;

  void _syncTicker(List<ActiveTimer> timers) {
    final hasRunning = timers.any((timer) => timer.isRunning == true);
    if (hasRunning) {
      _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
        state = DateTime.now();
      });
      return;
    }

    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
