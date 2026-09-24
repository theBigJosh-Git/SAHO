import 'package:flutter_test/flutter_test.dart';
import 'package:saho/app/app.dart';

void main() {
  testWidgets('SAHO app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const SahoApp());

    expect(find.text('SAHO\nServices At Home'), findsOneWidget);
  });
}