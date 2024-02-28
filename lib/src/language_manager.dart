import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:app_manager/src/language_base.dart';
import 'package:path_provider/path_provider.dart';

class LanguageManager extends ChangeNotifier implements LanguageBase {
  SharedPreferences? _prefs;
  String? mode = "watch";
  final String prefKey = "language";
  late List<String> languages;
  late String language;
  late String? l10nPath;
  LanguageManager(
    this.languages,
    this.l10nPath,
  ) {
    initPrefs();
    loadLanguage();
  }
  // getting aa list of supported languages
  List<Locale> get supportedLocales => languages.map((e) => Locale(e)).toList();
  @override
  loadLanguage() async {
    // getting the current theme from prefs;
    // var appstate = _prefs!.getString(prefKey) ?? 'ar';
    if (l10nPath == null || l10nPath!.isEmpty) return null;
    // final File file = File('lib/l10n');
    var directory = (await getApplicationDocumentsDirectory()).path;
    var files = Directory(path.join(directory))
        .listSync(); //use your folder name insted of resume.
    print(files.length);
    // var appstate = _prefs!.getString(prefKey) ?? 'ar';
    // languages.map(
    //   (e) => {
    //     if (e == appstate) {_prefs?.setString('language', e)}
    //   },
    // );
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
