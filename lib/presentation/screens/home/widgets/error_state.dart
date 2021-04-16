import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xkcd_comics_viewer/generated/locale_keys.g.dart';

/// Widget that displays an error message when there is an unexpected state of the application
class ErrorState extends StatelessWidget {
  const ErrorState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(LocaleKeys.this_should_never_happen.tr()),
      ),
    );
  }
}