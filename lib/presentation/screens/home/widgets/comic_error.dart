import 'package:flutter/material.dart';

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
            Text("Error! $errorMessage"),
            SizedBox(
              height: 12.0,
            ),
            OutlinedButton(
              onPressed: reloadComic,
              child: Text(
                "Retry",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
