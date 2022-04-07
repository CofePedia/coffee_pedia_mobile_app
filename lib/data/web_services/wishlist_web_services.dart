import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/toggle_products_in_wishlist.dart';
import 'package:coffepedia/data/models/wishlist.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class WishlistWebServices {
  final userDao = UserDao();

  Future<Wishlist> getWishlist() async {
    final url = Uri.parse(baseUrl + 'wishlist');
    GetTokenDatabase? token = await userDao.getUserToken();
    //print("token wishlist = " + token!.getToken!);

    final http.Response response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response wishlist ${response.body}");

    if (response.statusCode == 200) {
      return Wishlist.fromJson(
        json.decode(response.body),
      );
    } else {
      print(json.decode(response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<ToggleProductsInWishlist> getToggleProductsInWishlist(
      String productId) async {
    final url = Uri.parse(baseUrl + 'toggleProductInWishlist');
    //print("token toggleProductInWishlist = " + token!.getToken!);
    GetTokenDatabase? token = await userDao.getUserToken();

    final http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
      body: {
        'product_id': productId,
      },
    );
    print("response toggleProductInWishlist ${response.body}");

    if (response.statusCode == 200) {
      return ToggleProductsInWishlist.fromJson(
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
