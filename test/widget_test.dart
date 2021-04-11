import 'package:flutter_test/flutter_test.dart';

import 'package:xkcd_comics_viewer/presentation/screens/splash/splash_screen.dart';

void main() {
  testWidgets('Splash screen is visible', (WidgetTester tester) async {
    await tester.pumpWidget(SplashScreen());

    expect(find.text('xkcd comics viewer'), findsOneWidget);
  });
}
