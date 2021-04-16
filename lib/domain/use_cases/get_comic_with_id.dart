import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/domain/repository/comics_repository.dart';
import 'package:xkcd_comics_viewer/domain/use_cases/get_comic_use_case.dart';

/// Use case that gets a comic with a specific ID from the repository
class GetComicWithId implements GetComicUseCase {
  GetComicWithId(this._comicsRepository, this._id);

  final ComicsRepository _comicsRepository;
  final int _id;

  @override
  Future<Comic?> invoke() {
    return _comicsRepository.getComic(_id);
  }
}
