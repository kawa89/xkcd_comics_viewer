import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xkcd_comics_viewer/generated/locale_keys.g.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/error_state.dart';

import '../../../commons/test_localization.dart';

void main() async {
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  testWidgets('ErrorState widget test', (WidgetTester tester) async {
    // given
    await tester.pumpWidget(
      TestLocalizationWidget(
        testWidget: ErrorState(),
      ),
    );

    // when
    await tester.pump();

    // then
    final thisShouldNeverHappenTextFinder = find.textContaining(LocaleKeys.this_should_never_happen.tr());
    expect(thisShouldNeverHappenTextFinder, findsOneWidget);
  });
}
