import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/login_data_user.dart';
import 'package:coffepedia/data/models/signup_data_user.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class AuthWebServices {
  final userDao = UserDao();

  Future<LoginData> getToken(String password, String mobile) async {
    final url = Uri.parse(baseUrl + 'auth/login');
    final http.Response response = await http.post(
      url,
      body: {'password': password, 'mobile': mobile},
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

  Future<Signup> signUp({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? mobile,
  }) async {
    final url = Uri.parse(baseUrl + 'auth/register');
    final http.Response response = await http.post(
      url,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'mobile': mobile
      },
    );
    print("response ${response.body}");

    if (response.statusCode == 201) {
      return Signup.fromJson(
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
