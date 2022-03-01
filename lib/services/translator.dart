import 'dart:convert';

import 'package:coffepedia/services/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

class Translator with ChangeNotifier {
  // ---- Config ---- //
  List<String> langsList = [
    'en',
    'ar',
  ];
  late Locale _locale;

  late Map<dynamic, dynamic> _values; // define languages
  String langDirectory = 'assets/langs/'; // define directory
  ///------------------------------------------------
  /// delegatess
  ///------------------------------------------------
  Iterable<LocalizationsDelegate> delegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];

  Translator() {
    if (Prefs.getString('currentLang') != null) {
      _locale = Locale(Prefs.getString('currentLang')!, "");
    } else {
      _locale = Locale(langsList[0]);
    }
  }

  ///------------------------------------------------
  /// Locals List
  ///------------------------------------------------
  Iterable<Locale> locals() => langsList.map<Locale>(
        (lang) => new Locale(lang, ''),
      );

  ///------------------------------------------------
  /// Transle : [key]
  ///------------------------------------------------
  String translate(String key, [Map<String, String>? arguments]) {
    String value =
        (_values == null || _values[key] == null) ? '$key' : _values[key];
    if (key.toString().contains(".")) {
      // print("AAAA");
      List<String> keys = key.split(".");
      if (_values == null) {
        value = '$key';
      } else {
        // value = _values["wishlist_screen"]["egp"];
        if (_values[keys.elementAt(0)][keys.elementAt(1)] == null)
          value = '$key';
        else
          value = _values[keys.elementAt(0)][keys.elementAt(1)];
      }
    }
    // print("_values = $_values");
    // print("value = $value");
    if (arguments == null) return value;
    for (var key in arguments.keys) {
      value = value.replaceAll(key, arguments[key]!);
    }
    return value;
  }

  Future changeLanguage() async {
    String newLang = _locale == null
        ? langsList[0]
        : _locale.languageCode == "ar"
            ? "en"
            : "ar";
    debugPrint(newLang);
    _locale = Locale(newLang);
    String content = await rootBundle.loadString(
      langDirectory + "$newLang.json",
    );
    _values = json.decode(content);
    await Prefs.setString('currentLang', newLang);
    notifyListeners();
  }

  ///------------------------------------------------
  /// Active Language Code (String)
  ///------------------------------------------------
  String get currentLanguage => _locale.languageCode;

  ///------------------------------------------------
  /// Active Locale
  ///------------------------------------------------
  Locale get locale => _locale;

  ///------------------------------------------------
  /// Initialize Plugin
  ///------------------------------------------------
  Future<Null> init([String? lang]) async {
    if (_locale == null) {
      if (Prefs.getString('currentLang') != null) {
        _locale = Locale(Prefs.getString('currentLang')!, "");
      } else {
        _locale = Locale(langsList[0]);
      }
    }
    await initLanguage();
    notifyListeners();
    return null;
  }

  ///------------------------------------------------
  /// Initialize Active Language
  ///------------------------------------------------
  Future<Null> initLanguage() async {
    if (_locale == null) {
      _locale = Locale(langsList[0]);
    }
    String content = await rootBundle.loadString(
      langDirectory + "${_locale.languageCode}.json",
    );
    _values = json.decode(content);
    return null;
  }

  ///------------------------------------------------
  /// Determine Active Layout (bool)
  ///------------------------------------------------
  isDirectionRTL(BuildContext context) {
    return intl.Bidi.isRtlLanguage(
        Localizations.localeOf(context).languageCode);
  }
}
