import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/make_order.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class MakeOrderWebServices {
  final userDao = UserDao();

  Future<MakeOrder> getMakeOrder(String addressId, String paymentId) async {
    final url = Uri.parse(baseUrl + 'makeOrder');

    GetTokenDatabase? token = await userDao.getUserToken();

    print("token makeOrder = " + token!.getToken!);

    final http.Response response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ' + token.getToken!},
      body: {
        'address_id': addressId,
        'payment_id': paymentId,
      },
    );
    print("response makeOrder ${response.body}");

    if (response.statusCode == 200) {
      return MakeOrder.fromJson(
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
