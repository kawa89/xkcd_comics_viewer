import 'package:xkcd_comics_viewer/domain/entity/comic.dart';

/// State class for a single comic: Possible states are:
/// - ComicStateLoading, with a factory constructor ComicState.loading()
/// - ComicStateLoaded, with a factory constructor ComicState.loaded(...)
/// - ComicStateError, with a factory constructor ComicState.error(...)
class ComicState {
  ComicState._();

  factory ComicState.loading() = ComicStateLoading;

  factory ComicState.loaded(Comic comic) = ComicStateLoaded;

  factory ComicState.error(String errorMessage) = ComicStateError;
}

/// State of a comic that represents the loading state
class ComicStateLoading extends ComicState {
  ComicStateLoading() : super._();
}

/// State of a comic that represents the loaded state
class ComicStateLoaded extends ComicState {
  ComicStateLoaded(this.comic) : super._();

  final Comic comic;
}

/// State of a comic that represents the error state
class ComicStateError extends ComicState {
  ComicStateError(this.errorMessage) : super._();

  final String errorMessage;
}
