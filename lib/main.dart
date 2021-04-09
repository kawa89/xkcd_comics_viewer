import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xkcd_comics_viewer/screens/home/home_screen.dart';
import 'package:xkcd_comics_viewer/screens/splash/splash_screen.dart';

void main() {
  runApp(XkcdComicsViewerApp());
}

class XkcdComicsViewerApp extends StatelessWidget {
  static const String splashScreenRoute = '/';
  static const String homeScreenRoute = '/home';

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
        switch(settings.name) {
          case XkcdComicsViewerApp.splashScreenRoute:
            return MaterialPageRoute(builder: (_) => SplashScreen());
            break;
          case XkcdComicsViewerApp.homeScreenRoute:
            return MaterialPageRoute(builder: (_) => HomeScreen());
            break;
          default: {
            throw Exception('Route does not exist.');
          }
        }
      },
    );
  }
}