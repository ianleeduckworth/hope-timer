import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import 'database_provider.dart';

final publishedTimersProvider = StreamProvider<List<PublishedTimer>>((ref) {
  return ref.watch(publishedTimersDaoProvider).watchAll();
});
