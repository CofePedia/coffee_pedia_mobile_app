import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/order_history.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class OrderHistoryWebServices {
  final userDao = UserDao();

  Future<OrderHistory> getOrderHistory() async {
    final url = Uri.parse(baseUrl + 'orderHistory');

    GetTokenDatabase? token = await userDao.getUserToken();

    //print("token orderHistory = " + token!.getToken!);

    final http.Response response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response orderHistory ${response.body}");

    if (response.statusCode == 200) {
      return OrderHistory.fromJson(
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
