import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/aboutCofePedia.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class AboutCofepediaWebServices {
  Future<AboutCofePedia> getAboutCofepedia() async {
    final uri = Uri.https(
      getBaseUrl,
      '/about_us',
    );
    final http.Response response = await http.get(
      uri,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    if (response.statusCode == 200) {
      return AboutCofePedia.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response exception about us ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
