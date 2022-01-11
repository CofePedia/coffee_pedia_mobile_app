import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/me.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class MeWebServices {
  final userDao = UserDao();

  Future<MeModel> getMe() async {
    final url = Uri.parse(baseUrl + 'auth/me');
    GetTokenDatabase? token = await userDao.getUserToken();
    print("token me = " + token!.getToken!);

    final http.Response response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ' + token.getToken!},
    );
    print("response me ${response.body}");


    if (response.statusCode == 200) {
      return MeModel.fromJson(
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
