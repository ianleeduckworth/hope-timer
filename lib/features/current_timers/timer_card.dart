import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/daos/active_timers_dao.dart';
import '../../data/database.dart';
import '../../providers/analytics_provider.dart';
import '../../providers/database_provider.dart';
import '../../utils/duration_format.dart';
import '../../utils/project_name.dart';
import '../../utils/timer_elapsed.dart';
import '../../widgets/confirm_dialog.dart';
import '../../widgets/duration_input_dialog.dart';

class TimerCard extends ConsumerStatefulWidget {
  const TimerCard({super.key, required this.timer});

  final ActiveTimer timer;

  @override
  ConsumerState<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends ConsumerState<TimerCard> {
  late final TextEditingController _projectController;

  @override
  void initState() {
    super.initState();
    _projectController = TextEditingController(text: widget.timer.projectName);
  }

  @override
  void didUpdateWidget(covariant TimerCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.timer.id != widget.timer.id &&
        _projectController.text != widget.timer.projectName) {
      _projectController.text = widget.timer.projectName;
    }
  }

  @override
  void dispose() {
    _projectController.dispose();
    super.dispose();
  }

  ActiveTimersDao get _dao => ref.read(activeTimersDaoProvider);

  int get _elapsedMs {
    ref.watch(timerTickProvider);
    return computeElapsedMs(widget.timer);
  }

  Future<void> _deleteTimer() async {
    final confirmed = await showConfirmDialog(
      context: context,
      title: 'Delete timer?',
      message:
          'This will permanently remove this timer and its tracked time.',
    );
    if (confirmed == true && mounted) {
      await _dao.deleteTimer(widget.timer.id);
    }
  }

  Future<void> _publishTimer() async {
    final confirmed = await showConfirmDialog(
      context: context,
      title: 'Publish timer?',
      message:
          'This will save ${formatDurationMs(_elapsedMs)} to published timers and reset this timer to zero.',
      confirmLabel: 'Publish',
      isDestructive: false,
    );
    if (confirmed == true && mounted) {
      await _dao.publish(widget.timer.id);
    }
  }

  Future<void> _resetTimer() async {
    final targetMs = await showDurationInputDialog(
      context: context,
      title: 'Reset timer to',
    );
    if (targetMs != null && mounted) {
      await _dao.resetTo(widget.timer.id, targetMs);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projectLabel = displayProjectName(widget.timer.projectName);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        title: Text(
          projectLabel,
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Text(
          formatDurationMs(_elapsedMs),
          style: theme.textTheme.headlineSmall?.copyWith(
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: 'Play',
              onPressed: widget.timer.isRunning
                  ? null
                  : () => _dao.play(widget.timer.id),
              icon: const Icon(Icons.play_arrow),
            ),
            IconButton(
              tooltip: 'Pause',
              onPressed: widget.timer.isRunning
                  ? () => _dao.pause(widget.timer.id)
                  : null,
              icon: const Icon(Icons.pause),
            ),
            IconButton(
              tooltip: 'Delete',
              onPressed: _deleteTimer,
              icon: Icon(
                Icons.close,
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ),
        children: [
          TextField(
            controller: _projectController,
            decoration: const InputDecoration(
              labelText: 'Project name',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (value) =>
                _dao.updateProjectName(widget.timer.id, value),
            onEditingComplete: () =>
                _dao.updateProjectName(widget.timer.id, _projectController.text),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              OutlinedButton.icon(
                onPressed: () => _dao.addHour(widget.timer.id),
                icon: const Icon(Icons.add),
                label: const Text('Add 1 hour'),
              ),
              OutlinedButton.icon(
                onPressed: () => _dao.removeHour(widget.timer.id),
                icon: const Icon(Icons.remove),
                label: const Text('Remove 1 hour'),
              ),
              OutlinedButton.icon(
                onPressed: _resetTimer,
                icon: const Icon(Icons.restart_alt),
                label: const Text('Reset to value'),
              ),
              FilledButton.icon(
                onPressed: _publishTimer,
                icon: const Icon(Icons.publish),
                label: const Text('Publish'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
