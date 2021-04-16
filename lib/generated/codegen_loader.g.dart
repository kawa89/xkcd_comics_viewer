// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> pl = {
    "splash_intro_text": "xkcd comics viewer",
    "error": "Błąd: {errorMessage}",
    "retry": "Spróbuj ponownie",
    "this_should_never_happen": "Błąd! To nie powinno się wydarzyć!"
  };
  static const Map<String, dynamic> en = {
    "splash_intro_text": "xkcd comics viewer",
    "error": "Error: {errorMessage}",
    "retry": "Retry",
    "this_should_never_happen": "Error! This should never happen"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {"pl": pl, "en": en};
}
