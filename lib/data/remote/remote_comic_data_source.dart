import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

/// interface of a remote comic data source
abstract class RemoteComicDataSource {
  Future<Comic?> getComic(int id);

  Future<Comic?> getLatestComic();
}
