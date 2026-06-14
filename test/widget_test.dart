import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hope_timer/main.dart';

void main() {
  testWidgets('Hope Timer app loads', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: HopeTimerRoot(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Hope Timer'), findsOneWidget);
    expect(find.text('Current'), findsOneWidget);
  });
}
