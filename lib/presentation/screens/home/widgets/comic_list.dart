import 'package:flutter/material.dart';
import 'package:xkcd_comics_viewer/presentation/screens/home/widgets/comic_tile.dart';

/// Widget that displays a list of comics
class ComicList extends StatelessWidget {
  const ComicList({
    Key? key,
    required this.latestComicId,
    required this.reloadLatestComic,
  }) : super(key: key);

  final int latestComicId;
  final Future Function() reloadLatestComic;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: reloadLatestComic,
      child: ListView.builder(
        itemCount: latestComicId,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemBuilder: (_, index) {
          return ComicTile(
            id: latestComicId - index,
          );
        },
      ),
    );
  }
}
