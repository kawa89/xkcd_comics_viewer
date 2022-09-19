import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

/// Business logic interface of a comic repository
abstract class ComicsRepository {
  Future<Comic?> getComic(int id);

  Future<Comic?> getLatestComic();
}
