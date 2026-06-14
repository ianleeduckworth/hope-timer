import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import 'database_provider.dart';

final activeTimersProvider = StreamProvider<List<ActiveTimer>>((ref) {
  return ref.watch(activeTimersDaoProvider).watchAll();
});
