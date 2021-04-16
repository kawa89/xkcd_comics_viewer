// Mocks generated by Mockito 5.0.4 from annotations
// in xkcd_comics_viewer/test/data/local/hive_local_comic_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:hive/hive.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:xkcd_comics_viewer/data/local/hive_comic_to_comic_mapper.dart' as _i5;
import 'package:xkcd_comics_viewer/data/local/model/hive_comic.dart' as _i3;
import 'package:xkcd_comics_viewer/domain/entity/comic.dart' as _i2;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeComic extends _i1.Fake implements _i2.Comic {}

class _FakeHiveComic extends _i1.Fake implements _i3.HiveComic {}

/// A class which mocks [Box].
///
/// See the documentation for Mockito's code generation for more information.
class MockBox<E> extends _i1.Mock implements _i4.Box<E> {
  MockBox() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Iterable<E> get values => (super.noSuchMethod(Invocation.getter(#values), returnValue: []) as Iterable<E>);

  @override
  Iterable<E> valuesBetween({dynamic startKey, dynamic endKey}) =>
      (super.noSuchMethod(Invocation.method(#valuesBetween, [], {#startKey: startKey, #endKey: endKey}), returnValue: []) as Iterable<E>);

  @override
  E? getAt(int? index) => (super.noSuchMethod(Invocation.method(#getAt, [index])) as E?);

  @override
  Map<dynamic, E> toMap() => (super.noSuchMethod(Invocation.method(#toMap, []), returnValue: <dynamic, E>{}) as Map<dynamic, E>);
}

/// A class which mocks [HiveComicToComicMapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveComicToComicMapper extends _i1.Mock implements _i5.HiveComicToComicMapper {
  MockHiveComicToComicMapper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Comic mapToComic(_i3.HiveComic? hiveComic) => (super.noSuchMethod(Invocation.method(#mapToComic, [hiveComic]), returnValue: _FakeComic()) as _i2.Comic);

  @override
  _i3.HiveComic mapToHiveComic(_i2.Comic? comic) =>
      (super.noSuchMethod(Invocation.method(#mapToHiveComic, [comic]), returnValue: _FakeHiveComic()) as _i3.HiveComic);
}

/// A class which mocks [Comic].
///
/// See the documentation for Mockito's code generation for more information.
class MockComic extends _i1.Mock implements _i2.Comic {
  MockComic() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get id => (super.noSuchMethod(Invocation.getter(#id), returnValue: 0) as int);

  @override
  set id(int? _id) => super.noSuchMethod(Invocation.setter(#id, _id), returnValueForMissingStub: null);

  @override
  String get title => (super.noSuchMethod(Invocation.getter(#title), returnValue: '') as String);

  @override
  set title(String? _title) => super.noSuchMethod(Invocation.setter(#title, _title), returnValueForMissingStub: null);

  @override
  String get imageUrl => (super.noSuchMethod(Invocation.getter(#imageUrl), returnValue: '') as String);

  @override
  set imageUrl(String? _imageUrl) => super.noSuchMethod(Invocation.setter(#imageUrl, _imageUrl), returnValueForMissingStub: null);

  @override
  int get hashCode => (super.noSuchMethod(Invocation.getter(#hashCode), returnValue: 0) as int);

  @override
  _i2.Comic copyWith({int? id, String? title, String? imageUrl}) =>
      (super.noSuchMethod(Invocation.method(#copyWith, [], {#id: id, #title: title, #imageUrl: imageUrl}), returnValue: _FakeComic()) as _i2.Comic);

  @override
  String toString() => (super.noSuchMethod(Invocation.method(#toString, []), returnValue: '') as String);

  @override
  bool operator ==(Object? other) => (super.noSuchMethod(Invocation.method(#==, [other]), returnValue: false) as bool);

  @override
  Map<String, dynamic> toMap() => (super.noSuchMethod(Invocation.method(#toMap, []), returnValue: <String, dynamic>{}) as Map<String, dynamic>);
}

/// A class which mocks [HiveComic].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveComic extends _i1.Mock implements _i3.HiveComic {
  MockHiveComic() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get id => (super.noSuchMethod(Invocation.getter(#id), returnValue: 0) as int);

  @override
  String get title => (super.noSuchMethod(Invocation.getter(#title), returnValue: '') as String);

  @override
  String get imageUrl => (super.noSuchMethod(Invocation.getter(#imageUrl), returnValue: '') as String);

  @override
  bool get isInBox => (super.noSuchMethod(Invocation.getter(#isInBox), returnValue: false) as bool);

  @override
  _i6.Future<void> save() =>
      (super.noSuchMethod(Invocation.method(#save, []), returnValue: Future<void>.value(null), returnValueForMissingStub: Future.value()) as _i6.Future<void>);

  @override
  _i6.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []), returnValue: Future<void>.value(null), returnValueForMissingStub: Future.value())
          as _i6.Future<void>);
}
