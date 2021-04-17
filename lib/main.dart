import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xkcd_comics_viewer/generated/codegen_loader.g.dart';
import 'package:xkcd_comics_viewer/presentation/screens/details/details_screen.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/home_screen.dart';
import 'package:xkcd_comics_viewer/presentation/screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      assetLoader: CodegenLoader(),
      supportedLocales: [
        Locale('pl'),
        Locale('en'),
      ],
      path: 'assets/translations',
      useOnlyLangCode: true,
      saveLocale: false,
      fallbackLocale: Locale('en'),
      child: XkcdComicsViewerApp(),
    ),
  );
}

class XkcdComicsViewerApp extends StatelessWidget {
  static const String splashScreenRoute = '/';
  static const String homeScreenRoute = '/home';
  static const String detailsScreenRoute = '/home/details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey[50],
        accentColor: Colors.grey[700],
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: XkcdComicsViewerApp.splashScreenRoute,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case XkcdComicsViewerApp.splashScreenRoute:
            return MaterialPageRoute(builder: (_) => SplashScreen());
          case XkcdComicsViewerApp.homeScreenRoute:
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case XkcdComicsViewerApp.detailsScreenRoute:
            return MaterialPageRoute(builder: (_) => DetailsScreen(imageUrl: settings.arguments as String));
          default:
            {
              throw Exception('Route does not exist.');
            }
        }
      },
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
