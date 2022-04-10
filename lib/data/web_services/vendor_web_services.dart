import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/vendor_details.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class VendorWebServices {
  Future<VendorDetails> getVendorDetails(int vendorId) async {
    final url = Uri.parse(baseUrl + '/vendor_details/$vendorId');

    final http.Response response = await http.get(url, headers: {
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    });
    print("response vendor details ${response.body}");

    if (response.statusCode == 200) {
      return VendorDetails.fromJson(
        json.decode(response.body),
      );
    } else {
      print("vendor details error = " + (response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
