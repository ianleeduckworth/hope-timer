import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/daos/analytics_dao.dart';
import '../../providers/analytics_provider.dart';
import '../../utils/duration_format.dart';

class AnalyticsTab extends ConsumerWidget {
  const AnalyticsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(analyticsPeriodProvider);
    final analyticsAsync = ref.watch(analyticsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: SegmentedButton<AnalyticsPeriod>(
            segments: const [
              ButtonSegment(value: AnalyticsPeriod.day, label: Text('Day')),
              ButtonSegment(value: AnalyticsPeriod.week, label: Text('Week')),
              ButtonSegment(
                value: AnalyticsPeriod.month,
                label: Text('Month'),
              ),
            ],
            selected: {period},
            onSelectionChanged: (selection) {
              ref.read(analyticsPeriodProvider.notifier).state =
                  selection.first;
            },
          ),
        ),
        Expanded(
          child: analyticsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) =>
                Center(child: Text('Error loading analytics: $error')),
            data: (rows) {
              if (rows.isEmpty) {
                return _EmptyState();
              }
              return AnalyticsTable(rows: rows);
            },
          ),
        ),
      ],
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
              Icons.bar_chart,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              'No analytics yet',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Publish timers to see project totals by day, week, and month.',
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

class AnalyticsTable extends StatelessWidget {
  const AnalyticsTable({super.key, required this.rows});

  final List<AnalyticsRow> rows;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Project')),
            DataColumn(label: Text('Period')),
            DataColumn(label: Text('Total Time')),
          ],
          rows: rows
              .map(
                (row) => DataRow(
                  cells: [
                    DataCell(Text(row.projectName)),
                    DataCell(Text(row.periodLabel)),
                    DataCell(Text(formatDurationCompact(row.totalMs))),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
