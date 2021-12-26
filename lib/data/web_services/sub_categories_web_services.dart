import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/sub_categories.dart';
import 'package:http/http.dart' as http;

class SubCategoriesWebServices {
  Future<SubCategories> getSubCategories() async {
    final url = Uri.parse(baseUrl + 'categories/1/sub');
    final http.Response response = await http.get(
      url,
    );
    print("response ${response.body}");

    if (response.statusCode == 200) {
      return SubCategories.fromJson(
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
