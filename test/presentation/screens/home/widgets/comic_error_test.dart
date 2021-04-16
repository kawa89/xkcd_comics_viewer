import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xkcd_comics_viewer/generated/locale_keys.g.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_error.dart';

import '../../../../commons/function_handler.dart';
import '../../../../commons/test_localization.dart';
import 'comic_error_test.mocks.dart';

@GenerateMocks([FunctionHandler])
void main() async {
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  testWidgets('ComicError widget test', (WidgetTester tester) async {
    var _mockErrorMessage = "error_message";

    // given
    var _functionHandler = MockFunctionHandler();
    when(_functionHandler.simpleMockFunction).thenReturn(() => {});

    await tester.pumpWidget(
      TestLocalizationWidget(
        testWidget: ComicError(
          errorMessage: _mockErrorMessage,
          reloadComic: _functionHandler.simpleMockFunction,
        ),
      ),
    );

    // when
    await tester.pump();

    // then
    final errorMessageFinder = find.textContaining(LocaleKeys.error.tr(namedArgs: {'errorMessage': _mockErrorMessage}));
    expect(errorMessageFinder, findsOneWidget);

    final retryButtonFinder = find.text(LocaleKeys.retry.tr());
    expect(retryButtonFinder, findsOneWidget);

    await tester.tap(find.byType(OutlinedButton));
    await tester.pump();
    verify(_functionHandler.simpleMockFunction);
  });
}
