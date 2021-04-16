import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_loaded.dart';

import '../../../commons/test_localization.dart';
import 'comic_loaded_test.mocks.dart';

@GenerateMocks([
  Comic,
])
void main() async {
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  testWidgets('ComicLoaded test', (WidgetTester tester) async {
    var _mockTitle = "title";
    var _mockImageUrl = "imageUrl";
    var _mockId = 123;

    // given
    var _comic = MockComic();
    when(_comic.title).thenReturn(_mockTitle);
    when(_comic.imageUrl).thenReturn(_mockImageUrl);
    when(_comic.id).thenReturn(_mockId);

    await tester.pumpWidget(
      TestLocalizationWidget(
        testWidget: ComicLoaded(
          comic: _comic,
        ),
      ),
    );

    // when
    await tester.pump();

    // then
    final titleTextFinder = find.textContaining(_mockTitle);
    expect(titleTextFinder, findsOneWidget);

    final comicNumberTextFinder = find.text('#$_mockId');
    expect(comicNumberTextFinder, findsOneWidget);

    final comicImageFinder = find.byType(CachedNetworkImage);
    expect(comicImageFinder, findsOneWidget);
  });
}
