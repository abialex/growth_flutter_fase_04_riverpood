import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:showcase/app.dart';

void main() {
  testWidgets('shows the showcase home page title', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: ShowcaseApp()));

    expect(find.text('Design System Showcase'), findsOneWidget);
  });
}
