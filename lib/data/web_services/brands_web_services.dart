import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/brands.dart';
import 'package:http/http.dart' as http;

class BrandsWebServices {
  Future<Brands> getBrands() async {
    final url = Uri.parse(baseUrl + 'homeBrands');
    final http.Response response = await http.get(
      url,
    );
    print("response ${response.body}");

    if (response.statusCode == 200) {
      return Brands.fromJson(
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
