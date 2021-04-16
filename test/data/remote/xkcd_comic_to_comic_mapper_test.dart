import 'package:flutter_test/flutter_test.dart';
import 'package:xkcd_comics_viewer/data/remote/model/xkcd_comic.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

void main() {
  const mockTitle = "mock_title";
  const mockId = 123;
  const mockImageUrl = "mock_imageUrl";

  group('XkcdComicToComicMapper', () {
    // given to all
    final _sut = XkcdComicToComicMapper();

    test('Map HiveComic to Comic', () {
      // given
      XkcdComic xkcdComic = XkcdComic(mockId, mockTitle, mockImageUrl);

      // when
      Comic comic = _sut.map(xkcdComic);

      // then
      expect(comic.title, mockTitle);
      expect(comic.id, mockId);
      expect(comic.imageUrl, mockImageUrl);
    });
  });
}
