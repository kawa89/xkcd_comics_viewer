import 'package:logger/logger.dart';
import 'package:xkcd_comics_viewer/data/local/hive_local_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_remote_data_source.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/repository/comics_repository.dart';

/// Repository that operates on the xkcd comics
/// It uses a [_xkcdRemoteDataSource] to fetch the latest comic or a comic with a known ID
/// It uses a [_hiveLocalComicDataSource] to cache the comics that have been downloaded
class XkcdComicsRepository implements ComicsRepository {
  XkcdComicsRepository(this._xkcdRemoteDataSource, this._hiveLocalComicDataSource);

  final XkcdRemoteDataSource _xkcdRemoteDataSource;
  final HiveLocalComicDataSource _hiveLocalComicDataSource;
  final Logger _logger = Logger();

  /// Returns a comic with a specific ID. If a comic is found in a [_hiveLocalComicDataSource] its returned. If not, [_xkcdRemoteDataSource]
  /// is used to download the comic from a remote data source
  @override
  Future<Comic?> getComic(int id) async {
    Comic? comic = await _hiveLocalComicDataSource.getComic(id);
    if (comic != null) {
      _logger.d("Return comic $id from Hive");
      return comic;
    } else {
      var comic = await _xkcdRemoteDataSource.getComic(id);
      if (comic != null) {
        await _hiveLocalComicDataSource.saveComic(comic);
      }
      _logger.d("Return comic $id from REST client");
      return comic;
    }
  }

  /// Returns the latest comic from [_xkcdRemoteDataSource]. If it's downloaded its saved to [_hiveLocalComicDataSource]
  @override
  Future<Comic?> getLatestComic() async {
    var comic = await _xkcdRemoteDataSource.getLatestComic();
    if (comic != null) {
      await _hiveLocalComicDataSource.saveComic(comic);
    }
    _logger.d("Return latest comic from REST client");
    return comic;
  }
}
