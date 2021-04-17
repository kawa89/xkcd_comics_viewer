import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_state.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_comic_use_case.dart';
import 'package:xkcd_comics_viewer/generated/locale_keys.g.dart';

part 'comic_store.g.dart';

class ComicStore = _ComicStore with _$ComicStore;

abstract class _ComicStore with Store {
  final GetComicUseCase getComicUseCase;

  _ComicStore({required this.getComicUseCase});

  @observable
  ComicState comicState = ComicState.loading();

  @action
  load() async {
    comicState = ComicState.loading();
    try {
      Comic? latestComic = await getComicUseCase.invoke();
      if (latestComic != null) {
        comicState = ComicState.loaded(latestComic);
      } else {
        comicState = ComicState.error(LocaleKeys.something_went_wrong.tr());
      }
    } catch (e) {
      comicState = ComicState.error(LocaleKeys.something_went_wrong_with_error.tr(namedArgs: {"errorType": "${e.runtimeType}"}));
      Logger().e(e);
    }
  }
}