import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xkcd_comics_viewer/constants/get_it_instance_names.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_state.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_store.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_error.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_list.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/error_state.dart';

/// Main app widget that tries to load the latest comic and then shows a list of comics, that are in a descending order by they publication date
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ComicStore _latestComicStore = GetIt.I.get<ComicStore>(instanceName: GetItInstanceNames.LATEST_COMIC_STORE);

  @override
  void initState() {
    _latestComicStore.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (BuildContext context) {
            ComicState state = _latestComicStore.comicState;
            switch (state.runtimeType) {
              case ComicStateLoading:
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case ComicStateLoaded:
                {
                  var latestComic = (state as ComicStateLoaded).comic;
                  var reloadLatestComic = () {
                    return _latestComicStore.load();
                  };
                  return ComicList(
                    latestComicId: latestComic.id,
                    reloadLatestComic: reloadLatestComic,
                  );
                }
              case ComicStateError:
                {
                  var errorMessage = (state as ComicStateError).errorMessage;
                  var reloadLatestComic = () {
                    _latestComicStore.load();
                  };
                  return ComicError(
                    errorMessage: errorMessage,
                    reloadComic: reloadLatestComic,
                  );
                }
              default:
                {
                  return ErrorState();
                }
            }
          },
        ),
      ),
    );
  }
}
