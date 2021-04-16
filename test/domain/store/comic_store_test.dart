import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_state.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_store.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_comic_use_case.dart';

import '../../commons/mock_exception.dart';
import 'comic_store_test.mocks.dart';

@GenerateMocks([
  GetComicUseCase,
  Comic,
])
void main() {
  group('ComicStore', () {
    test('Check state of comic, when loading is successful from the use case', () async {
      // given
      var _comic = MockComic();
      var _comicUseCase = MockGetComicUseCase();
      when(_comicUseCase.invoke()).thenAnswer((_) => Future.value(_comic));
      final _sut = ComicStore(getComicUseCase: _comicUseCase);

      // when
      expect(_sut.comicState, isInstanceOf<ComicStateLoading>());
      await _sut.load();
      //then
      expect(_sut.comicState, isInstanceOf<ComicStateLoaded>());
    });

    test('Check state of comic, when loading is a failure from the use case', () async {
      // given
      var _comicUseCase = MockGetComicUseCase();
      when(_comicUseCase.invoke()).thenThrow(MockException());
      final _sut = ComicStore(getComicUseCase: _comicUseCase);

      // when
      expect(_sut.comicState, isInstanceOf<ComicStateLoading>());
      await _sut.load();
      //then
      expect(_sut.comicState, isInstanceOf<ComicStateError>());
    });
  });
}
