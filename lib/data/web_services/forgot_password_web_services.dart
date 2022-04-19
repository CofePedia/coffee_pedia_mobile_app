import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/forgot_mobile.dart';
import 'package:coffepedia/data/models/update_password.dart';
import 'package:coffepedia/main.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordWebServices {
  Future<ForgotMobile> postForgotMobile(String mobile) async {
    var headers = {
      'Content-Type': 'application/json',
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    };

    var request = http.Request(
      'POST',
      Uri.parse(baseUrl + '/auth/mobile'),
    );
    request.body = json.encode({"mobile": mobile});
    request.headers.addAll(headers);
    final response = await request.send();
    final http.Response res = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      final result = ForgotMobile.fromJson(
        json.decode(res.body),
      );
      BotToast.showText(text: result.data!.msg!);
      print("forgot mobile ${result.data!.msg!}");
      return result;
    } else {
      throw Exception(
        ForgotMobile.fromJson(json.decode(res.body)),
      );
    }
  }

  Future<UpdatePassword> postUpdatePassword(
    String mobile,
    String code,
    String password,
    String passwordConfirmation,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    };

    var request = http.Request(
      'POST',
      Uri.parse(baseUrl + '/auth/newPassword'),
    );
    request.body = json.encode({
      "mobile": mobile,
      "code": code,
      "password": password,
      "password_confirmation": passwordConfirmation,
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final http.Response res = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      final result = UpdatePassword.fromJson(
        json.decode(res.body),
      );
      BotToast.showText(text: result.data!.msg!);
      return result;
    } else {
      throw Exception(
        UpdatePassword.fromJson(json.decode(res.body)),
      );
    }
  }
}
