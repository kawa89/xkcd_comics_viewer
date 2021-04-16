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
import 'package:xkcd_comics_viewer/presentation/screens/home/home_screen.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_error.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_list.dart';

import '../../commons/mock_exception.dart';
import '../../commons/test_localization.dart';
import 'home_screen_test.mocks.dart';

@GenerateMocks([
  GetComicUseCase,
  Comic,
])
void main() async {
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  var _mockTitle = "title";
  var _mockImageUrl = "imageUrl";
  var _mockId = 123;

  // given to all
  var _comic = MockComic();
  when(_comic.title).thenReturn(_mockTitle);
  when(_comic.imageUrl).thenReturn(_mockImageUrl);
  when(_comic.id).thenReturn(_mockId);

  var _useCase = MockGetComicUseCase();

  group('HomeScreen widget tests', () {
    testWidgets('ComicTile widget test when comic is loaded', (WidgetTester tester) async {
      reset(_useCase);
      when(_useCase.invoke()).thenAnswer((_) => Future.value(_comic));
      await GetIt.I.reset(dispose: true);
      GetIt.I.registerSingleton(ComicStore(getComicUseCase: _useCase), instanceName: GetItInstanceNames.XKCD_LATEST_COMIC_STORE);
      GetIt.I.registerFactoryParam<ComicStore, int, void>((id, _) => ComicStore(getComicUseCase: _useCase));

      await tester.pumpWidget(
        TestLocalizationWidget(
          testWidget: HomeScreen(),
        ),
      );

      // when
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // then
      final comicListFinder = find.byType(ComicList);
      expect(comicListFinder, findsOneWidget);
    });

    testWidgets('ComicTile widget test when comic load is a failure', (WidgetTester tester) async {
      reset(_useCase);
      when(_useCase.invoke()).thenThrow(MockException());
      await GetIt.I.reset(dispose: true);
      GetIt.I.registerSingleton(ComicStore(getComicUseCase: _useCase), instanceName: GetItInstanceNames.XKCD_LATEST_COMIC_STORE);

      await tester.pumpWidget(
        TestLocalizationWidget(
          testWidget: HomeScreen(),
        ),
      );

      // when
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // then
      final comicErrorFinder = find.byType(ComicError);
      expect(comicErrorFinder, findsOneWidget);

      final comicListFinder = find.byType(ComicList);
      expect(comicListFinder, findsNothing);
    });

    testWidgets('ComicTile widget test when comic loading is taking a while', (WidgetTester tester) async {
      reset(_useCase);
      when(_useCase.invoke()).thenAnswer((_) async {
        return Future.value(_comic);
      });
      await GetIt.I.reset(dispose: true);
      GetIt.I.registerSingleton(ComicStore(getComicUseCase: _useCase), instanceName: GetItInstanceNames.XKCD_LATEST_COMIC_STORE);

      await tester.pumpWidget(
        TestLocalizationWidget(
          testWidget: HomeScreen(),
        ),
      );

      // when
      await tester.pump();

      // then
      final comicCircularProgressIndicatorFinder = find.byType(CircularProgressIndicator);
      expect(comicCircularProgressIndicatorFinder, findsOneWidget);
    });
  });
}
