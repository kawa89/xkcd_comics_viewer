import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xkcd_comics_viewer/domain/entity/comic.dart';
import 'package:xkcd_comics_viewer/main.dart';

/// Widget that displays a single comic
class ComicLoaded extends StatelessWidget {
  const ComicLoaded({
    Key? key,
    required this.comic,
  }) : super(key: key);

  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comic.title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                '#${comic.id}',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Expanded(
          child: CachedNetworkImage(
            imageUrl: comic.imageUrl,
            errorWidget: (context, _, __) {
              return Center(
                child: const Icon(
                  Icons.error,
                  size: 36.0,
                ),
              );
            },
            imageBuilder: (context, image) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(XkcdComicsViewerApp.detailsScreenRoute, arguments: comic.imageUrl);
              },
              child: Hero(
                tag: comic.imageUrl,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            fadeOutDuration: const Duration(
              milliseconds: 200,
            ),
            fadeInDuration: const Duration(
              milliseconds: 300,
            ),
          ),
        )
      ],
    );
  }
}
