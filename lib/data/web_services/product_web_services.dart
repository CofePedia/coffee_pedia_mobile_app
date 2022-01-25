import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/product.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class ProductWebServices {
  final userDao = UserDao();

  Future<Product> getProduct(int id) async {
    final url = Uri.parse(baseUrl + 'product/$id');
    GetTokenDatabase? token = await userDao.getUserToken();

    print("token product " + token!.getToken!);

    final http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ' + token.getToken!},
    );
    print("response product ${response.body}");

    if (response.statusCode == 200) {
      return Product.fromJson(
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
