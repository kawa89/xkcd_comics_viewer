// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xkcd_comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XkcdComic _$XkcdComicFromJson(Map<String, dynamic> json) {
  return XkcdComic(
    json['num'] as int,
    json['title'] as String,
    json['alt'] as String,
    json['img'] as String,
  );
}

Map<String, dynamic> _$XkcdComicToJson(XkcdComic instance) => <String, dynamic>{
      'num': instance.num,
      'title': instance.title,
      'alt': instance.alt,
      'img': instance.img,
    };
