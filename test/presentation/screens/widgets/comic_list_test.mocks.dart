// Mocks generated by Mockito 5.0.4 from annotations
// in xkcd_comics_viewer/test/presentation/screens/widgets/comic_list_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:xkcd_comics_viewer/domain/entity/comic.dart' as _i2;
import 'package:xkcd_comics_viewer/domain/use_cases/get_comic_use_case.dart' as _i5;

import '../../../commons/function_handler.dart' as _i3;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeComic extends _i1.Fake implements _i2.Comic {}

/// A class which mocks [FunctionHandler].
///
/// See the documentation for Mockito's code generation for more information.
class MockFunctionHandler extends _i1.Mock implements _i3.FunctionHandler {
  MockFunctionHandler() {
    _i1.throwOnMissingStub(this);
  }

  @override
  dynamic Function() get simpleMockFunction => (super.noSuchMethod(Invocation.getter(#simpleMockFunction), returnValue: () => null) as dynamic Function());

  @override
  set simpleMockFunction(dynamic Function()? _simpleMockFunction) =>
      super.noSuchMethod(Invocation.setter(#simpleMockFunction, _simpleMockFunction), returnValueForMissingStub: null);

  @override
  _i4.Future<dynamic> Function() get simpleFutureMockFunction =>
      (super.noSuchMethod(Invocation.getter(#simpleFutureMockFunction), returnValue: () => Future<dynamic>.value(null)) as _i4.Future<dynamic> Function());

  @override
  set simpleFutureMockFunction(_i4.Future<dynamic> Function()? _simpleFutureMockFunction) =>
      super.noSuchMethod(Invocation.setter(#simpleFutureMockFunction, _simpleFutureMockFunction), returnValueForMissingStub: null);
}

/// A class which mocks [GetComicUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetComicUseCase extends _i1.Mock implements _i5.GetComicUseCase {
  MockGetComicUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Comic?> invoke() =>
      (super.noSuchMethod(Invocation.method(#invoke, []), returnValue: Future<_i2.Comic?>.value(_FakeComic())) as _i4.Future<_i2.Comic?>);
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
