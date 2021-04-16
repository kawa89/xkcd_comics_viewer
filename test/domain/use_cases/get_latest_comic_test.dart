import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/repository/comics_repository.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_latest_comic.dart';

import 'get_latest_comic_test.mocks.dart';

@GenerateMocks([
  ComicsRepository,
  Comic,
])
void main() {
  // given
  var _comicsRepository = MockComicsRepository();
  var _comic = MockComic();

  final _sut = GetLatestComic(_comicsRepository);

  group('GetLatestComic', () {
    test('Get latest comic from the use case', () async {
      // given
      when(_comicsRepository.getLatestComic()).thenAnswer((_) => Future.value(_comic));

      // when
      await _sut.invoke();

      //then
      verify(_comicsRepository.getLatestComic());
      verifyNever(_comicsRepository.getComic(any));
    });
  });
}
