import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:http/http.dart' as http;

class CategoryProductsWebServices {
  Future<CategoryProducts> getCategoryProducts(
      {int? subCategoryId, int? categoryId}) async {
    final url = Uri.parse(
        baseUrl + '/products?category=$categoryId&subCategory=$subCategoryId');
    final http.Response response = await http.get(
      url,
    );
    print("response category products ${response.body}");

    if (response.statusCode == 200) {
      return CategoryProducts.fromJson(
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
