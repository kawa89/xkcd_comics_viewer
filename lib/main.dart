import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xkcd_comics_viewer/screens/splash/splash_screen.dart';

void main() {
  runApp(XkcdComicsViewerApp());
}

class XkcdComicsViewerApp extends StatelessWidget {
  static String splashScreenRoute = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xkcd comics viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blueAccent,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: XkcdComicsViewerApp.splashScreenRoute,
      onGenerateRoute: (settings) {
        if (settings.name == XkcdComicsViewerApp.splashScreenRoute) return MaterialPageRoute(builder: (_) => SplashScreen());
        return MaterialPageRoute(builder: (_) => throw Exception('Route does not exist.'));
      },
    );
  }
}