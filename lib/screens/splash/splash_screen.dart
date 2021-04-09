import 'package:flutter/material.dart';
import 'package:xkcd_comics_viewer/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var _minimalDelay = Future<dynamic>.delayed(const Duration(milliseconds: 2000));

    Future.wait<dynamic>([
      _minimalDelay,
    ]).then((value) {
      Navigator.of(context).pushReplacementNamed(XkcdComicsViewerApp.homeScreenRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'xkcd comics viewer',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
