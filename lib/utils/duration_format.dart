String formatDurationMs(int ms) {
  final totalSeconds = (ms / 1000).floor();
  final hours = totalSeconds ~/ 3600;
  final minutes = (totalSeconds % 3600) ~/ 60;
  final seconds = totalSeconds % 60;

  return '${hours.toString().padLeft(2, '0')}:'
      '${minutes.toString().padLeft(2, '0')}:'
      '${seconds.toString().padLeft(2, '0')}';
}

String formatDurationCompact(int ms) {
  final totalMinutes = (ms / 60000).floor();
  if (totalMinutes < 60) {
    return '${totalMinutes}m';
  }

  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;
  if (minutes == 0) {
    return '${hours}h';
  }
  return '${hours}h ${minutes}m';
}

int durationToMs({required int hours, required int minutes, int seconds = 0}) {
  return ((hours * 3600) + (minutes * 60) + seconds) * 1000;
}
