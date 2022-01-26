import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/categories.dart';
import 'package:http/http.dart' as http;

class CategoriesWebServices {
  Future<Categories> getCategories() async {
    final url = Uri.parse(baseUrl + 'categories?show_sub=1');
    final http.Response response = await http.get(
      url,
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
