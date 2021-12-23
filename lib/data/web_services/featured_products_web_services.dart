import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/featured_products.dart';
import 'package:http/http.dart' as http;

class FeaturedProductsWebServices {

  Future<FeaturedProducts> getFeaturedProducts() async {
    final url = Uri.parse(baseUrl + 'products/featured');
    final http.Response response = await http.get(
      url,
    );
    print("response ${response.body}");

    if (response.statusCode == 200) {
      return FeaturedProducts.fromJson(
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