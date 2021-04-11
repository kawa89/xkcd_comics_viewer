import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// Widget that displays an image in a fullscreen
class DetailsScreen extends StatelessWidget {
  final String imageUrl;

  DetailsScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: PhotoView(
          heroAttributes: PhotoViewHeroAttributes(
            tag: imageUrl,
          ),
          imageProvider: CachedNetworkImageProvider(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
