import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/repository/comics_repository.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_comic_use_case.dart';

/// Use case that gets the latest comic from the repository
class GetLatestComic implements GetComicUseCase {
  GetLatestComic(this._comicsRepository);

  final ComicsRepository _comicsRepository;

  Future<Comic?> invoke() async {
    return _comicsRepository.getLatestComic();
  }
}
