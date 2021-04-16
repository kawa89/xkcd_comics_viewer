import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:xkcd_comics_viewer/generated/locale_keys.g.dart';

/// Widget that displays an error message and a retry button
class ComicError extends StatelessWidget {
  const ComicError({
    Key? key,
    required this.errorMessage,
    required this.reloadComic,
  }) : super(key: key);

  final String errorMessage;
  final void Function() reloadComic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.error.tr(
                namedArgs: {'errorMessage': errorMessage},
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            OutlinedButton(
              onPressed: reloadComic,
              child: Text(
                LocaleKeys.retry.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
