import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xkcd_comics_viewer/constants/get_it_instance_names.dart';
import 'package:xkcd_comics_viewer/constants/hive_box_names.dart';
import 'package:xkcd_comics_viewer/data/local/hive_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/local/hive_local_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/local/model/hive_comic.dart';
import 'package:xkcd_comics_viewer/data/remote/rest_client/xkcd_rest_client.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_remote_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/repository/default_comics_repository.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_store.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_comic_with_id.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_latest_comic.dart';
import 'package:xkcd_comics_viewer/generated/locale_keys.g.dart';
import 'package:xkcd_comics_viewer/main.dart';

/// Widget that shows a splash screen. Here we can add our initial async tasks, that need to finish before showing the main screen.
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var _minimalDelay = Future<dynamic>.delayed(const Duration(milliseconds: 1500));

    Future.wait<dynamic>([
      _minimalDelay,
      initHive().then((_) => initGetIt()),
    ]).then((value) {
      Navigator.of(context).pushReplacementNamed(XkcdComicsViewerApp.homeScreenRoute);
    });
    super.initState();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveComicAdapter());
    await Hive.openBox<HiveComic>(HiveBoxNames.XKCD_HIVE_COMIC_BOX);
  }

  Future<void> initGetIt() async {
    XkcdRemoteComicDataSource xkcdRemoteDataSource = XkcdRemoteComicDataSource(XkcdRestClient(Dio()), XkcdComicToComicMapper());
    HiveLocalComicDataSource hiveComicService = HiveLocalComicDataSource(HiveComicToComicMapper(), Hive.box<HiveComic>(HiveBoxNames.XKCD_HIVE_COMIC_BOX));
    DefaultComicsRepository xkcdComicsRepository = DefaultComicsRepository(xkcdRemoteDataSource, hiveComicService);
    GetIt.I.registerSingleton(ComicStore(getComicUseCase: GetLatestComic(xkcdComicsRepository)), instanceName: GetItInstanceNames.XKCD_LATEST_COMIC_STORE);
    GetIt.I.registerFactoryParam<ComicStore, int, void>((id, _) => ComicStore(getComicUseCase: GetComicWithId(xkcdComicsRepository, id!)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            LocaleKeys.splash_intro_text.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
