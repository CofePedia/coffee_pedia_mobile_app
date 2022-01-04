import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class BasketWebServices {
  final userDao = UserDao();

  Future<Basket> getBasket() async {
    final url = Uri.parse(baseUrl + 'cart');
    print(baseUrl + 'cart');
    GetTokenDatabase? token = await userDao.getUserToken();

    print("token1 = " + token!.getToken!);

    final http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ' + token.getToken!},
    );
    print("response Basket ${response.body}");

    if (response.statusCode == 200) {
      return Basket.fromJson(
        json.decode(response.body),
      );
    } else {
      print(json.decode(response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
