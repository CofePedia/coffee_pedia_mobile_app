import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/brand_products.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class BrandProductsWebServices {
  Future<BrandProducts> getBrandProducts(int brandId) async {
    final url = Uri.parse(baseUrl + '/product_by_brand/$brandId');

    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response BrandProducts  ${response.body}");

    if (response.statusCode == 200) {
      return BrandProducts.fromJson(
        json.decode(response.body),
      );
    } else {
      print("vendor BrandProducts error = " + (response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
