import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

/// Business logic interface of a comic use case
abstract class GetComicUseCase {
  Future<Comic?> invoke();
}
