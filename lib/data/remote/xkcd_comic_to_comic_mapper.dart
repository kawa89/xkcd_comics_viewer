import 'package:xkcd_comics_viewer/data/remote/model/xkcd_comic.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

/// Mapper class that maps an API comic model to a business comic model
class XkcdComicToComicMapper {
  Comic map(XkcdComic xkcdComic) {
    return Comic(id: xkcdComic.num, title: xkcdComic.title, imageUrl: xkcdComic.img);
  }
}
