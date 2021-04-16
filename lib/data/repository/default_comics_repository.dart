import 'package:logger/logger.dart';
import 'package:xkcd_comics_viewer/data/local/local_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/remote/remote_comic_data_source.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/repository/comics_repository.dart';

/// Repository that operates on the comics
/// It uses a [_remoteDataSource] to fetch the latest comic or a comic with a known ID
/// It uses a [_localComicDataSource] to cache the comics that have been downloaded
class DefaultComicsRepository implements ComicsRepository {
  DefaultComicsRepository(this._remoteDataSource, this._localComicDataSource);

  final RemoteComicDataSource _remoteDataSource;
  final LocalComicDataSource _localComicDataSource;
  final Logger _logger = Logger();

  /// Returns a comic with a specific ID. If a comic is found in a [_localComicDataSource] is returned. If not, [_remoteDataSource]
  /// is used to download the comic from a remote data source
  @override
  Future<Comic?> getComic(int id) async {
    Comic? localComic = await _localComicDataSource.getComic(id);
    if (localComic != null) {
      _logger.d("Return comic $id from Hive");
      return localComic;
    } else {
      var remoteComic = await _remoteDataSource.getComic(id);
      if (remoteComic != null) {
        await _localComicDataSource.saveComic(remoteComic);
      }
      _logger.d("Return comic $id from REST client");
      return remoteComic;
    }
  }

  /// Returns the latest comic from [_remoteDataSource]. If it's downloaded its saved to [_localComicDataSource]
  @override
  Future<Comic?> getLatestComic() async {
    var remoteComic = await _remoteDataSource.getLatestComic();
    if (remoteComic != null) {
      await _localComicDataSource.saveComic(remoteComic);
    }
    _logger.d("Return latest comic from REST client");
    return remoteComic;
  }
}
