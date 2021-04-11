import 'package:flutter/material.dart';

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
        child: Text("Error! This should never happen"),
      ),
    );
  }
}
