import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: HopeTimerRoot(),
    ),
  );
}

class HopeTimerRoot extends StatelessWidget {
  const HopeTimerRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hope Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HopeTimerApp(),
    );
  }
}
