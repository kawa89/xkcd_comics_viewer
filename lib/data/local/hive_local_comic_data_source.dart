import 'package:hive/hive.dart';
import 'package:xkcd_comics_viewer/data/local/hive_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/local/local_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/local/model/hive_comic.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

/// Class that uses Hive to cache comics with a specific ID
class HiveLocalComicDataSource implements LocalComicDataSource {
  HiveLocalComicDataSource(this._hiveComicToComicMapper, this._box);

  final Box _box;
  final HiveComicToComicMapper _hiveComicToComicMapper;

  @override
  Future<Comic?> getComic(int id) async {
    HiveComic? hiveComic = _box.get(id);
    if (hiveComic != null) {
      return _hiveComicToComicMapper.mapToComic(hiveComic);
    } else
      return null;
  }

  @override
  Future<void> saveComic(Comic comic) async {
    return _box.put(comic.id, _hiveComicToComicMapper.mapToHiveComic(comic));
  }
}
