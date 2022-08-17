import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/main.dart';
import 'package:http/http.dart' as http;

import '../models/static_pages.dart';

class StaticPagesWebServices {
  Future<StaticPage> getPrivacyPolicy() async {
    final url = Uri.parse(baseUrl + '/static_pages?slug=privacy-policy');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    if (response.statusCode == 200) {
      return StaticPage.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<StaticPage> getTermsAndConditions() async {
    final url = Uri.parse(baseUrl + '/static_pages?slug=terms-condition');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    if (response.statusCode == 200) {
      print("terms true ${StaticPage.fromJson(
        json.decode(response.body),
      )}");
      return StaticPage.fromJson(
        json.decode(response.body),
      );
    } else {
      print("terms false ${StaticPage.fromJson(
        json.decode(response.body),
      )}");
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
