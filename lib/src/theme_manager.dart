import 'dart:developer';

import 'package:app_manager/src/shared_prefs_model.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager extends ChangeNotifier implements PrefsModel {
  final String prefKey = "ThemeKey";

  SharedPreferences? _prefs;
  ThemeMode? mode = ThemeMode.system;

  ThemeManager() {
    initPrefs();
  }
  @override
  initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    loadTheme();
    notifyListeners();
  }

  @override
  makeDark() {
    _prefs!.setString(prefKey, 'dark');
    mode = ThemeMode.dark;
    // log(mode.toString());
    notifyListeners();
  }

  @override
  makeLigth() {
    _prefs!.setString(prefKey, 'light');
    mode = ThemeMode.light;
    notifyListeners();
  }

  @override
  makeSystem() {
    _prefs!.setString(prefKey, 'system');
    mode = ThemeMode.light;
    notifyListeners();
  }

  @override
  toogleTheme() async {
    await initPrefs();
    //darkMode = _prefs!.getBool(key) ?? false;
    var appstate = _prefs!.getString(prefKey) ?? 'light';
    switch (appstate) {
      case 'light':
        print('it is light');
        mode = ThemeMode.dark;

        makeDark();
        break;
      case 'dark':
        print('it is light');
        mode = ThemeMode.light;
        makeLigth();
        break;
      default:
        print('it is default');
        mode = ThemeMode.dark;
        makeDark();
        break;
    }
    log(mode.toString());
    notifyListeners();
  }

  @override
  loadTheme() {
    // getting the current theme from prefs;
    var appstate = _prefs!.getString(prefKey) ?? 'light';

    switch (appstate) {
      case 'light':
        mode = ThemeMode.dark;

        makeDark();
        break;
      case 'dark':
        mode = ThemeMode.light;
        makeLigth();
        break;
      default:
        print('it is default');
        mode = ThemeMode.system;

        break;
    }

    throw UnimplementedError();
  }

  @override
  themeMode() async {
    await initPrefs();
    //darkMode = _prefs!.getBool(key) ?? false;
    var appstate = _prefs!.getString(prefKey);
    switch (appstate) {
      case 'light':
        mode = ThemeMode.light;
        break;

      case 'dark':
        mode = ThemeMode.dark;
        break;

      default:
        mode = ThemeMode.system;
        break;
    }
    notifyListeners();
  }
}
