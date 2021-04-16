import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/repository/comics_repository.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_comic_with_id.dart';

import 'get_comic_with_id_test.mocks.dart';

@GenerateMocks([
  ComicsRepository,
  Comic,
])
void main() {
  var _comicId = 123;
  // given
  var _comicsRepository = MockComicsRepository();
  var _comic = MockComic();

  final _sut = GetComicWithId(_comicsRepository, _comicId);

  group('GetLatestComic', () {
    test('Get latest comic from the use case', () async {
      // given
      when(_comicsRepository.getComic(_comicId)).thenAnswer((_) => Future.value(_comic));

      // when
      await _sut.invoke();

      //then
      verify(_comicsRepository.getComic(_comicId));
      verifyNever(_comicsRepository.getLatestComic());
    });
  });
}
