import 'package:flutter_test/flutter_test.dart';
import 'package:xkcd_comics_viewer/data/local/hive_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/local/model/hive_comic.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

void main() {
  const mockTitle = "mock_title";
  const mockId = 123;
  const mockImageUrl = "mock_imageUrl";

  group('HiveComicToComicMapper', () {
    final _sut = HiveComicToComicMapper();

    test('Map HiveComic to Comic', () {
      HiveComic hiveComic = HiveComic(title: mockTitle, id: mockId, imageUrl: mockImageUrl);
      Comic comic = _sut.mapToComic(hiveComic);
      expect(comic.title, mockTitle);
      expect(comic.id, mockId);
      expect(comic.imageUrl, mockImageUrl);
    });

    test('Map Comic to HiveComic', () {
      Comic comic = Comic(title: mockTitle, id: mockId, imageUrl: mockImageUrl);
      HiveComic hiveComic = _sut.mapToHiveComic(comic);
      expect(hiveComic.title, mockTitle);
      expect(hiveComic.id, mockId);
      expect(hiveComic.imageUrl, mockImageUrl);
    });
  });
}
