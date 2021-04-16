import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xkcd_comics_viewer/constants/get_it_instance_names.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/store/comic_store.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_comic_use_case.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_list.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_tile.dart';

import '../../../../commons/function_handler.dart';
import '../../../../commons/test_localization.dart';
import 'comic_list_test.mocks.dart';

@GenerateMocks([
  FunctionHandler,
  GetComicUseCase,
  Comic,
])
void main() async {
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  // given to all

  testWidgets('ComicList widget test', (WidgetTester tester) async {
    var _mockTitle = "title";
    var _mockImageUrl = "imageUrl";
    var _mockId = 123;

    // given
    var _comic = MockComic();
    when(_comic.title).thenReturn(_mockTitle);
    when(_comic.imageUrl).thenReturn(_mockImageUrl);
    when(_comic.id).thenReturn(_mockId);

    var _useCase = MockGetComicUseCase();
    when(_useCase.invoke()).thenAnswer((_) => Future.value(_comic));

    GetIt.I.registerSingleton(ComicStore(getComicUseCase: _useCase), instanceName: GetItInstanceNames.XKCD_LATEST_COMIC_STORE);
    GetIt.I.registerFactoryParam<ComicStore, int, void>((id, _) => ComicStore(getComicUseCase: _useCase));

    var _functionHandler = MockFunctionHandler();
    when(_functionHandler.simpleFutureMockFunction).thenAnswer((realInvocation) => () async {});

    await tester.pumpWidget(
      TestLocalizationWidget(
        testWidget: ComicList(
          latestComicId: _mockId,
          reloadLatestComic: _functionHandler.simpleFutureMockFunction,
        ),
      ),
    );

    // when
    await tester.pump();
    await tester.fling(find.byType(RefreshIndicator), Offset.fromDirection(10, 200), 20);
    await tester.pump();

    // then
    final comicTileFinder = find.byType(ComicTile);
    expect(comicTileFinder, findsWidgets);

    verify(_functionHandler.simpleFutureMockFunction);
  });
}
