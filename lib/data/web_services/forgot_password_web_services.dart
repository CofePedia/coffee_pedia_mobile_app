import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/forgot_mobile.dart';
import 'package:coffepedia/data/models/send_otp.dart';
import 'package:coffepedia/data/models/update_password.dart';
import 'package:coffepedia/data/models/verify_otp.dart';
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

    request.body = json.encode({"mobile": "2" + mobile});
    print("forgot? ${request.body}");

    request.headers.addAll(headers);
    final response = await request.send();
    final http.Response res = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      final result = ForgotMobile.fromJson(
        json.decode(res.body),
      );
      BotToast.showText(text: result.data!.msg!);
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
      "mobile": "2" + mobile,
      "code": code,
      "password": password,
      "password_confirmation": passwordConfirmation,
    });
    print("update forgot ${request.body}");

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

  Future<VerifyOTP> postVerifyNewPassword(String mobile, String otp) async {
    final url = Uri.parse(baseUrl + '/auth/verifyCode');

    final http.Response response = await http.post(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
      body: {
        'mobile': "2" + mobile,
        'code': otp,
      },
    );
    print("response VerifyNewPassword ${response.body}");

    if (response.statusCode == 200) {
      return VerifyOTP.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<SendOTP> postSendOTP(String mobile) async {
    var headers = {
      'Content-Type': 'application/json',
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    };

    var request = http.Request(
      'POST',
      Uri.parse(baseUrl + '/send_otp'),
    );
    request.body = json.encode({"phone_number": "2" + mobile});
    request.headers.addAll(headers);
    final response = await request.send();
    final http.Response res = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      final result = SendOTP.fromJson(
        json.decode(res.body),
      );
      BotToast.showText(text: result.data!.msg!.message!);
      print("otp ${result.data!.msg!.otp}");
      return result;
    } else {
      throw Exception(
        SendOTP.fromJson(json.decode(res.body)),
      );
    }
  }

  Future<VerifyOTP> postVerifyOTP(String mobile, String otp) async {
    var headers = {
      'Content-Type': 'application/json',
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    };

    var request = http.Request(
      'POST',
      Uri.parse(baseUrl + '/verfiy_otp'),
    );
    request.body = json.encode({
      "phone_number": "2" + mobile,
      "otp": otp,
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final http.Response res = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      final result = VerifyOTP.fromJson(
        json.decode(res.body),
      );
      BotToast.showText(text: result.data!.msg!);
      return result;
    } else {
      throw Exception(
        VerifyOTP.fromJson(json.decode(res.body)),
      );
    }
  }
}
