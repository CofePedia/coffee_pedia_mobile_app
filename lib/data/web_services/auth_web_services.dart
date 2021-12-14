import 'dart:convert';

import 'package:coffepedia/data/models/login_data_user.dart';
import 'package:http/http.dart' as http;

final _base = "https://api-staging.coffepidia.com/";
final _tokenEndpoint = "auth/login";
final _tokenURL = _base + _tokenEndpoint;

class AuthWebServices {
  Future<LoginData> getToken(String email, String password) async {
    print(_tokenURL);
    final url = Uri.parse(_tokenURL);
    final http.Response response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );
    print("response ${response.body}");

    if (response.statusCode == 200) {
      return LoginData.fromJson(
        json.decode(response.body)["data"],
      );
    } else {
      print(json.decode(response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
