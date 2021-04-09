import 'package:flutter/material.dart';
import 'package:xkcd_comics_viewer/main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'List',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}