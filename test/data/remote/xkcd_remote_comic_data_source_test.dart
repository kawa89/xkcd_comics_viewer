import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xkcd_comics_viewer/data/remote/model/xkcd_comic.dart';
import 'package:xkcd_comics_viewer/data/remote/rest_client/xkcd_rest_client.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/remote/xkcd_remote_comic_data_source.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

import 'xkcd_remote_comic_data_source_test.mocks.dart';

@GenerateMocks([
  XkcdRestClient,
  XkcdComicToComicMapper,
  XkcdComic,
  Comic,
])
void main() {
  // given to all
  var _comic = MockComic();

  var _xkcdComicToComicMapper = MockXkcdComicToComicMapper();
  when(_xkcdComicToComicMapper.map(any)).thenReturn(_comic);

  var _xkcdComic = MockXkcdComic();
  when(_xkcdComic.toString()).thenReturn("toString");

  var _xkcdRestClient = MockXkcdRestClient();

  final _sut = XkcdRemoteComicDataSource(_xkcdRestClient, _xkcdComicToComicMapper);

  group('XkcdRemoteComicDataSource', () {
    test('Get comic', () async {
      // given
      when(_xkcdRestClient.getComic(123)).thenAnswer((_) => Future.value(_xkcdComic));

      // when
      await _sut.getComic(123);

      // then
      verify(_xkcdComicToComicMapper.map(any));
      verify(_xkcdRestClient.getComic(123));
    });

    test('Get latest comic', () async {
      // given
      when(_xkcdRestClient.getLatestComic()).thenAnswer((_) => Future.value(_xkcdComic));

      // when
      await _sut.getLatestComic();

      // then
      verify(_xkcdComicToComicMapper.map(any));
      verify(_xkcdRestClient.getLatestComic());
    });
  });
}
