import 'package:flutter_test/flutter_test.dart';
import 'package:saho/app/app.dart';

void main() {
  testWidgets('SAHO home screen loads successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SahoApp());

    expect(find.text('SAHO'), findsOneWidget);
    expect(find.text('Services'), findsOneWidget);
    expect(find.text('Cleaning'), findsOneWidget);
    expect(find.text('Bookings'), findsOneWidget);
  });
}