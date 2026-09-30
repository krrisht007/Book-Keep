import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bookkeeper_app/widgets/thinking_orb.dart';

void main() {
  testWidgets('ThinkingOrb builds, animates, and disposes cleanly', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: ThinkingOrb(size: 20, color: Colors.orange)),
      ),
    );

    expect(find.byType(ThinkingOrb), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(seconds: 3));

    await tester.pumpWidget(const SizedBox());
  });
}
