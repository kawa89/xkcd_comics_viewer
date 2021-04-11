import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

/// interface of a local comic data source
abstract class LocalComicDataSource {
  Future<Comic?> getComic(int id);

  Future<void> saveComic(Comic comic);
}
