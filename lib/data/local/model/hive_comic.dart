import 'package:hive/hive.dart';

part 'hive_comic.g.dart';

@HiveType(typeId: 0)
class HiveComic extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String imageUrl;

  HiveComic({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}
