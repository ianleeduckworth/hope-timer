import '../data/database.dart';

int computeElapsedMs(ActiveTimer timer, [DateTime? now]) {
  now ??= DateTime.now();
  var elapsed = timer.elapsedMs;
  if (timer.isRunning && timer.runningSince != null) {
    elapsed += now.difference(timer.runningSince!).inMilliseconds;
  }
  return elapsed < 0 ? 0 : elapsed;
}
