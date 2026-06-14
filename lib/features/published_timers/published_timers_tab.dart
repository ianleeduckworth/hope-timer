import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/database.dart';
import '../../providers/database_provider.dart';
import '../../providers/published_timers_provider.dart';
import '../../utils/duration_format.dart';
import '../../utils/project_name.dart';
import '../../widgets/confirm_dialog.dart';

class PublishedTimersTab extends ConsumerWidget {
  const PublishedTimersTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publishedAsync = ref.watch(publishedTimersProvider);

    return publishedAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) =>
          Center(child: Text('Error loading published timers: $error')),
      data: (timers) {
        if (timers.isEmpty) {
          return _EmptyState();
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: timers.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) =>
              PublishedTimerTile(timer: timers[index]),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No published timers',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Publish a timer from the Current tab to see it here.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PublishedTimerTile extends ConsumerWidget {
  const PublishedTimerTile({super.key, required this.timer});

  final PublishedTimer timer;

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showConfirmDialog(
      context: context,
      title: 'Delete published timer?',
      message: 'This will remove this entry from published timers and analytics.',
    );
    if (confirmed == true) {
      await ref.read(publishedTimersDaoProvider).deleteTimer(timer.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final publishedLabel = DateFormat.yMMMd().add_jm().format(
      timer.publishedAt.toLocal(),
    );

    return Card(
      child: ListTile(
        title: Text(displayProjectName(timer.projectName)),
        subtitle: Text(publishedLabel),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              formatDurationCompact(timer.durationMs),
              style: theme.textTheme.titleMedium,
            ),
            IconButton(
              tooltip: 'Delete',
              onPressed: () => _delete(context, ref),
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
            ),
          ],
        ),
      ),
    );
  }
}
