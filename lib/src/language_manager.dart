import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_manager/src/language_base.dart';

class LanguageManager extends ChangeNotifier implements LanguageBase {
  SharedPreferences? _prefs;
  String? mode = "watch";
  final String prefKey = "language";
  late List<String> languages;
  late String language;
  LanguageManager(
    this.languages,
  ) {
    loadLanguage();
  }
  // getting aa list of supported languages
  List<Locale> get supportedLocales => languages.map((e) => Locale(e)).toList();
  @override
  loadLanguage() {
    // getting the current theme from prefs;
    var appstate = _prefs!.getString(prefKey) ?? 'ar';
    languages.map(
      (e) => {
        if (e == appstate) {_prefs?.setString('language', e)}
      },
    );
  }

  @override
  changeLocale(String languageCode) {
    if (languages.contains(languageCode)) {
      // save the language
    } else {
      return;
    }
  }

  @override
  getLocales() {
    // TODO: implement getLocales
    throw UnimplementedError();
  }

  @override
  initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    notifyListeners();
  }

  @override
  saveLocales() {
    var appstate = _prefs!.getString(prefKey) ?? 'ar';
    language = Locale(appstate) as String;
  }
}
