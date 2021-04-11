import 'package:xkcd_comics_viewer/data/remote/remote_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/remote/rest_clients/xkcd_rest_client.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

/// Class that uses an [_xkcdRestClient] to download the latest comic and comics with specific ID
class XkcdRemoteDataSource implements RemoteComicDataSource {
  XkcdRemoteDataSource(this._xkcdRestClient, this._xkcdComicToComicMapper);

  final XkcdRestClient _xkcdRestClient;
  final XkcdComicToComicMapper _xkcdComicToComicMapper;

  @override
  Future<Comic?> getComic(int id) async {
    var xkcdApiComic = await _xkcdRestClient.getComic(id);
    return _xkcdComicToComicMapper.map(xkcdApiComic);
  }

  @override
  Future<Comic?> getLatestComic() async {
    var xkcdApiComic = await _xkcdRestClient.getLatestComic();
    return _xkcdComicToComicMapper.map(xkcdApiComic);
  }
}
