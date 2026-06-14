import 'package:flutter/material.dart';

import '../features/analytics/analytics_tab.dart';
import '../features/current_timers/add_timer_fab.dart';
import '../features/current_timers/current_timers_tab.dart';
import '../features/published_timers/published_timers_tab.dart';

class HopeTimerApp extends StatefulWidget {
  const HopeTimerApp({super.key});

  @override
  State<HopeTimerApp> createState() => _HopeTimerAppState();
}

class _HopeTimerAppState extends State<HopeTimerApp> {
  int _selectedIndex = 0;

  static const _tabs = [
    _AppTab(
      label: 'Current',
      icon: Icons.timer_outlined,
      selectedIcon: Icons.timer,
      body: CurrentTimersTab(),
      showFab: true,
    ),
    _AppTab(
      label: 'Published',
      icon: Icons.history_outlined,
      selectedIcon: Icons.history,
      body: PublishedTimersTab(),
    ),
    _AppTab(
      label: 'Analytics',
      icon: Icons.bar_chart_outlined,
      selectedIcon: Icons.bar_chart,
      body: AnalyticsTab(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final tab = _tabs[_selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hope Timer'),
      ),
      body: tab.body,
      floatingActionButton: tab.showFab ? const AddTimerFab() : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: [
          for (final item in _tabs)
            NavigationDestination(
              icon: Icon(item.icon),
              selectedIcon: Icon(item.selectedIcon),
              label: item.label,
            ),
        ],
      ),
    );
  }
}

class _AppTab {
  const _AppTab({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.body,
    this.showFab = false,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget body;
  final bool showFab;
}
