import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/send_otp.dart';
import 'package:coffepedia/data/models/verify_otp.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class OTPWebServices {
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
    request.body = json.encode({"phone_number": mobile});
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
      "phone_number": mobile,
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
