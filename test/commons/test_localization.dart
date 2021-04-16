import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xkcd_comics_viewer/generated/codegen_loader.g.dart';

import 'test_app.dart';

/// Widget that creates a test app with localization for a [testWidget].
class TestLocalizationWidget extends StatelessWidget {
  final Widget testWidget;

  const TestLocalizationWidget({
    Key? key,
    required this.testWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/translations',
      assetLoader: CodegenLoader(),
      saveLocale: false,
      useOnlyLangCode: true,
      fallbackLocale: Locale('en'),
      supportedLocales: [Locale('en')],
      child: TestApp(
        testWidget: testWidget,
      ),
    );
  }
}
