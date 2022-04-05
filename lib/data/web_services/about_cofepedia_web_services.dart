import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/aboutCofePedia.dart';
import 'package:http/http.dart' as http;

class AboutCofepediaWebServices {
  Future<AboutCofePedia> getAboutCofepedia() async {
    final url = Uri.parse(baseUrl + 'about_us');
    final http.Response response = await http.get(
      url,
    );
    print("response about us ${response.body}");

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
