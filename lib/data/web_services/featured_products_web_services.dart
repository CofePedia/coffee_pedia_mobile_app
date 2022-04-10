import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/featured_products.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class FeaturedProductsWebServices {
  final userDao = UserDao();
  Future<FeaturedProducts> getFeaturedProducts() async {
    final url = Uri.parse(baseUrl + 'products/featured');

    GetTokenDatabase? token = await userDao.getUserToken();

    final http.Response response = await http.get(
      url,
      headers: token != null
          ? {
              'Authorization': 'Bearer ' + token.getToken!,
              'Content-Language': translator.currentLanguage,
              'platform': Platform.operatingSystem,
              'OSVersion': Platform.operatingSystemVersion,
            }
          : {
              'Content-Language': translator.currentLanguage,
              'platform': Platform.operatingSystem,
              'OSVersion': Platform.operatingSystemVersion,
            },
    );
    print("response featuredProducts ${response.body}");

    if (response.statusCode == 200) {
      return FeaturedProducts.fromJson(
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
