import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Widget that creates a test app for a [testWidget]. Its a must in widget testing.
class TestApp extends StatefulWidget {
  final Widget testWidget;

  const TestApp({
    Key? key,
    required this.testWidget,
  }) : super(key: key);

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: EasyLocalization.of(context)!.locale,
      supportedLocales: EasyLocalization.of(context)!.supportedLocales,
      localizationsDelegates: EasyLocalization.of(context)!.delegates,
      home: widget.testWidget,
      theme: ThemeData.light(),
    );
  }
}
