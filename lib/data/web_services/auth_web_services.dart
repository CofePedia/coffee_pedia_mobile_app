import 'dart:convert';

import 'package:coffepedia/data/models/login_data_user.dart';
import 'package:coffepedia/data/models/signup_data_user.dart';
import 'package:http/http.dart' as http;

final _base = "https://api-staging.coffepidia.com/";

class AuthWebServices {
  Future<LoginData> getToken(String email, String password) async {
    final url = Uri.parse(_base + 'auth/login');
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

  Future<SignupDataUser> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    final url = Uri.parse(_base + 'auth/register');
    final http.Response response = await http.post(
      url,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );
    print("response ${response.body}");

    if (response.statusCode == 200) {
      return SignupDataUser.fromJson(
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
