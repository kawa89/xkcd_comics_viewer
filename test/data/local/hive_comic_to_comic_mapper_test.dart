import 'package:flutter_test/flutter_test.dart';
import 'package:xkcd_comics_viewer/data/local/hive_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/local/model/hive_comic.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

void main() {
  const mockTitle = "mock_title";
  const mockId = 123;
  const mockImageUrl = "mock_imageUrl";

  group('HiveComicToComicMapper', () {
    // given to all
    final _sut = HiveComicToComicMapper();

    test('Map HiveComic to Comic', () {
      // given
      HiveComic hiveComic = HiveComic(title: mockTitle, id: mockId, imageUrl: mockImageUrl);

      // when
      Comic comic = _sut.mapToComic(hiveComic);

      // then
      expect(comic.title, mockTitle);
      expect(comic.id, mockId);
      expect(comic.imageUrl, mockImageUrl);
    });

    test('Map Comic to HiveComic', () {
      // given
      Comic comic = Comic(title: mockTitle, id: mockId, imageUrl: mockImageUrl);

      // when
      HiveComic hiveComic = _sut.mapToHiveComic(comic);

      // then
      expect(hiveComic.title, mockTitle);
      expect(hiveComic.id, mockId);
      expect(hiveComic.imageUrl, mockImageUrl);
    });
  });
}
