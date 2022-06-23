import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/order_history.dart';
import 'package:coffepedia/data/models/reorder.dart';
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

  Future<Reorder> postReorder(int orderNumber) async {
    final url = Uri.parse(baseUrl + 'reorder/$orderNumber');

    GetTokenDatabase? token = await userDao.getUserToken();

    final http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response reorder ${response.body}");

    if (response.statusCode == 200) {
      final reorder = Reorder.fromJson(
        json.decode(response.body),
      );
      BotToast.showText(text: reorder.data!.msg!.message!);
      return reorder;
    } else {
      print(json.decode(response.body).toString());
      final data = jsonDecode(response.body);
      data.forEach((key, value) {
        BotToast.showText(text: value[0]);

        throw value[0];
      });
      throw 'Error, Please try again';
    }
  }
}
