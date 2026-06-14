import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/database_provider.dart';

class AddTimerFab extends ConsumerWidget {
  const AddTimerFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => ref.read(activeTimersDaoProvider).createTimer(),
      tooltip: 'Add timer',
      child: const Icon(Icons.add),
    );
  }
}
