import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_state.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_store.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_error.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_loaded.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/error_state.dart';

/// Widget that displays a single comic, depending on its [ComicState] state
class ComicTile extends StatefulWidget {
  final int id;

  const ComicTile({Key? key, required this.id}) : super(key: key);

  @override
  _ComicTileState createState() => _ComicTileState();
}

class _ComicTileState extends State<ComicTile> {
  late final ComicStore _comicStore;

  @override
  void initState() {
    _comicStore = GetIt.I.get<ComicStore>(param1: widget.id);
    _comicStore.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        child: Observer(
          builder: (BuildContext context) {
            ComicState state = _comicStore.comicState;
            switch (state.runtimeType) {
              case ComicStateLoading:
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              case ComicStateLoaded:
                {
                  var comic = (state as ComicStateLoaded).comic;
                  return ComicLoaded(comic: comic);
                }
              case ComicStateError:
                {
                  var errorMessage = (state as ComicStateError).errorMessage;
                  var reloadComic = () {
                    _comicStore.load();
                  };
                  return ComicError(
                    errorMessage: errorMessage,
                    reloadComic: reloadComic,
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
