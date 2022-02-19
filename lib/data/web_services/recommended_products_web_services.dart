import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/recommended_products.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class RecommendedProductsWebServices {
  final userDao = UserDao();

  Future<RecommendedProducts> getRecommendedProducts() async {
    final url = Uri.parse(baseUrl + 'recommendedProduct');
    GetTokenDatabase? token = await userDao.getUserToken();

    //print("token RecommendedProducts = " + token!.getToken!);

    final http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ' + token!.getToken!},
    );
    print("response RecommendedProducts ${response.body}");

    if (response.statusCode == 200) {
      return RecommendedProducts.fromJson(
        json.decode(response.body),
      );
    } else {
      print("recommended = " +response.body.toString());
      print(json.decode(response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
