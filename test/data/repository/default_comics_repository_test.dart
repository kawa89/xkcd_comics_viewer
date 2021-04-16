import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xkcd_comics_viewer/data/local/local_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/remote/remote_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/repository/default_comics_repository.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

import '../../commons/mock_exception.dart';
import 'default_comics_repository_test.mocks.dart';

@GenerateMocks([
  RemoteComicDataSource,
  LocalComicDataSource,
  Comic,
])
void main() {
  // given to all
  var _remoteComicDataSource = MockRemoteComicDataSource();
  var _localComicDataSource = MockLocalComicDataSource();
  var _comic = MockComic();
  when(_comic.toString()).thenReturn("toString");

  final _sut = DefaultComicsRepository(_remoteComicDataSource, _localComicDataSource);

  group('DefaultComicsRepository', () {
    test('Get comic from local data source', () async {
      // given
      when(_localComicDataSource.getComic(123)).thenAnswer((_) => Future.value(_comic));

      // when
      await _sut.getComic(123);

      // then
      verify(_localComicDataSource.getComic(123));
      verifyNever(_remoteComicDataSource.getComic(123));
    });

    test('Get comic that is not in the local data source, but it is in the remote data source', () async {
      // given
      when(_localComicDataSource.getComic(123)).thenAnswer((_) => Future.value(null));
      when(_remoteComicDataSource.getComic(123)).thenAnswer((_) => Future.value(_comic));

      // when
      await _sut.getComic(123);

      // then
      verify(_localComicDataSource.getComic(123));
      verify(_remoteComicDataSource.getComic(123));
      verify(_localComicDataSource.saveComic(argThat(same(_comic))));
    });

    test('Get comic with exception from local data source', () async {
      // given
      when(_localComicDataSource.getComic(123)).thenThrow(MockException());

      // when
      expect(() => _sut.getComic(123), throwsA(isInstanceOf<MockException>()));

      // then
      verify(_localComicDataSource.getComic(123));
      verifyNever(_remoteComicDataSource.getComic(123));
      verifyNever(_localComicDataSource.saveComic(any));
    });

    test('Get latest comic with exception from remote data source', () async {
      // given
      when(_remoteComicDataSource.getLatestComic()).thenThrow(MockException());

      // when
      expect(() => _sut.getLatestComic(), throwsA(isInstanceOf<MockException>()));

      // then
      verify(_remoteComicDataSource.getLatestComic());
      verifyNever(_localComicDataSource.saveComic(any));
    });
  });
}
