import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

import 'model/hive_comic.dart';

/// Mapper class that maps a local Hive database comic model to a business comic model and vice versa.
class HiveComicToComicMapper {
  Comic mapToComic(HiveComic hiveComic) {
    return Comic(id: hiveComic.id, title: hiveComic.title, imageUrl: hiveComic.imageUrl);
  }

  HiveComic mapToHiveComic(Comic comic) {
    return HiveComic(id: comic.id, title: comic.title, imageUrl: comic.imageUrl);
  }
}
