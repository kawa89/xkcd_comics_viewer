@Skip('currently failing (see issue https://github.com/dart-lang/mockito/issues/381)')
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xkcd_comics_viewer/data/local/hive_comic_to_comic_mapper.dart';
import 'package:xkcd_comics_viewer/data/local/hive_local_comic_data_source.dart';
import 'package:xkcd_comics_viewer/data/local/model/hive_comic.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

import 'hive_local_comic_data_source_test.mocks.dart';

@GenerateMocks([Box, HiveComicToComicMapper, Comic, HiveComic])
void main() {
  group('HiveLocalComicDataSource', () {
    test('Save comic', () async {
      // given
      var _hiveComic = MockHiveComic();

      var _comic = MockComic();
      when(_comic.id).thenReturn(1);
      when(_comic.imageUrl).thenReturn("imageUrl");
      when(_comic.title).thenReturn("title");

      var _mapper = MockHiveComicToComicMapper();
      when(_mapper.mapToHiveComic(any)).thenReturn(_hiveComic);

      var _box = MockBox();
      when(_box.put(1, _hiveComic)).thenAnswer((_) async => Future.value());

      final _sut = HiveLocalComicDataSource(_mapper, _box);

      // when
      _sut.saveComic(_comic);

      // then
      verify(_mapper.mapToHiveComic(any));
      verify(_box.put(any, any));
    });
  });
}
