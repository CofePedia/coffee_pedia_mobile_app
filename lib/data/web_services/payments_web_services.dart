import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/payment.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class PaymentsWebServices {
  Future<Payments> getPayment() async {
    final url = Uri.parse(baseUrl + 'payments');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response Payments ${response.body}");

    if (response.statusCode == 200) {
      return Payments.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response exception Payments ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
