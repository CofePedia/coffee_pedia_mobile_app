import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class CategoryProductsWebServices {
  final userDao = UserDao();

  Future<CategoryProducts> getCategoryProducts(
    int subCategoryId,
    int categoryId,
    Map<String, List<String?>> multiMap,
    // Map<String, String> rangeMap,
  ) async {
    final Map<String, dynamic> queryParameters = {
      'category': categoryId.toString(),
      // 'brand[]': ["2", '3'],
    };

    if (multiMap.isNotEmpty) {
      queryParameters.addAll(multiMap);
    }

    if (subCategoryId != 0) {
      queryParameters.addAll({
        'subCategory': subCategoryId.toString(),
      });
    }
    final uri = Uri.https(getBaseUrl, '/products', queryParameters);
    print('queryParameters $queryParameters');
    GetTokenDatabase? token = await userDao.getUserToken();
    print("token product " + token!.getToken!);

    final http.Response response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer ' + token.getToken!},
    );
    print("response categoryProducts ${response.body}");
    if (response.statusCode == 200) {
      return CategoryProducts.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response category product exception ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
