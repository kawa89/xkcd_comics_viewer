import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xkcd_comics_viewer/constants/get_it_instance_names.dart';
import 'package:xkcd_comics_viewer/data/local/hive_local_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/local/hive_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/local/model/hive_comic.dart';
import 'package:xkcd_comics_viewer/data/remote/rest_clients/xkcd_rest_client.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_remote_data_source.dart';
import 'package:xkcd_comics_viewer/data/repository/xkcd_comics_repository.dart';
import 'package:xkcd_comics_viewer/domain/use_case/get_comic_with_id.dart';
import 'package:xkcd_comics_viewer/domain/use_case/get_latest_comic.dart';
import 'package:xkcd_comics_viewer/presentation/screens/details/details_screen.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/home_screen.dart';
import 'package:xkcd_comics_viewer/presentation/screens/splash/splash_screen.dart';

import 'domain/store/comic_store.dart';

Future<void> main() async {
  await initHive();
  initGetIt();
  runApp(XkcdComicsViewerApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveComicAdapter());
}

Future<void> initGetIt() async {
  XkcdRemoteDataSource xkcdRemoteDataSource = XkcdRemoteDataSource(XkcdRestClient(Dio()), XkcdComicToComicMapper());
  HiveLocalComicDataSource hiveComicService = HiveLocalComicDataSource(HiveComicToComicMapper());
  await hiveComicService.init();
  XkcdComicsRepository xkcdComicsRepository = XkcdComicsRepository(xkcdRemoteDataSource, hiveComicService);
  GetIt.I.registerSingleton(ComicStore(getComicUseCase: GetLatestComic(xkcdComicsRepository)), instanceName: GetItInstanceNames.LATEST_COMIC_STORE);
  GetIt.I.registerFactoryParam<ComicStore, int, void>((id, _) => ComicStore(getComicUseCase: GetComicWithId(xkcdComicsRepository, id!)));
}

class XkcdComicsViewerApp extends StatelessWidget {
  static const String splashScreenRoute = '/';
  static const String homeScreenRoute = '/home';
  static const String detailsScreenRoute = '/home/details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey[50],
        accentColor: Colors.grey,
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
    );
  }
}
