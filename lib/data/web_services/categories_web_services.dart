import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/categories.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class CategoriesWebServices {
  Future<Categories> getCategories() async {
    final url = Uri.parse(baseUrl + 'categories?show_sub=1');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response categories ${response.body}");

    if (response.statusCode == 200) {
      return Categories.fromJson(
        json.decode(response.body),
      );
    } else {
      print('response exception ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
