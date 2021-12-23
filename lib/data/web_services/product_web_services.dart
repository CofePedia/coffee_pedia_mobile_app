import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/product.dart';
import 'package:http/http.dart' as http;


class ProductWebServices{
  Future <Product> getProduct ()async {
    final url = Uri.parse(baseUrl + 'product/1');
    final http.Response response = await http.get(
      url,
    );
    print("response ${response.body}");

    if (response.statusCode == 200) {
      return Product.fromJson(
        json.decode(response.body),
      );
    } else {
      print('response exception ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}