import 'package:json_annotation/json_annotation.dart';

part 'xkcd_comic.g.dart';

@JsonSerializable()
class XkcdComic {
  int num;
  String title;
  String alt;
  String img;

  XkcdComic(this.num, this.title, this.alt, this.img);

  factory XkcdComic.fromJson(Map<String, dynamic> json) => _$XkcdComicFromJson(json);

  Map<String, dynamic> toJson() => _$XkcdComicToJson(this);

  @override
  String toString() {
    return 'XkcdComic{num: $num, title: $title, alt: $alt, img: $img}';
  }
}
