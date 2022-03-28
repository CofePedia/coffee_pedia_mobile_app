import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/add_to_basket.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/coupon.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/remove_from_basket.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class BasketWebServices {
  final userDao = UserDao();

  Future<Basket> getBasket() async {
    final url = Uri.parse(baseUrl + 'cart');
    GetTokenDatabase? token = await userDao.getUserToken();

    print("token cart = " + token!.getToken!);

    final http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ' + token.getToken!},
    );
    print("response Basket ${response.body}");

    if (response.statusCode == 200) {
      return Basket.fromJson(
        json.decode(response.body),
      );
    } else {
      print("response.body = " + (response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<AddToBasket> getAddToBasket(List<Map<String, int>> productsMap) async {
    GetTokenDatabase? token = await userDao.getUserToken();
    // print("my token = " + token!.token.toString());
    var headers = {
      'Authorization': 'Bearer ' + token!.getToken!,
      'Content-Type': 'application/json'
    };
    if (productsMap.length == 0) {
      print("productsMap is empty");
    }
    print("productsMap = " + productsMap.toString());

    var request = http.Request('POST', Uri.parse(baseUrl + '/cart/add'));
    request.body = json.encode({"products": productsMap}
        //     {
        //   "products": [
        //     {"product_id": 35, "quantity": 5}
        //   ]
        // }
        );
    request.headers.addAll(headers);
    final response = await request.send();
    final http.Response res = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print("basketResponse " + res.body);
      return AddToBasket.fromJson(json.decode(res.body));
    } else {
      print("failed basket ${response.reasonPhrase}");
      throw Exception(
        AddToBasket.fromJson(json.decode(res.body)),
      );
    }
  }

  Future<RemoveFromBasket> getRemoveFromBasket(String productId) async {
    final url = Uri.parse(baseUrl + '/removeFromCart');
    GetTokenDatabase? token = await userDao.getUserToken();

    //print("token remove from basket = " + token!.getToken!);

    final http.Response response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ' + token!.getToken!},
      body: {
        'product_id': productId,
      },
    );
    print("response remove from basket ${response.body}");

    if (response.statusCode == 200) {
      return RemoveFromBasket.fromJson(
        json.decode(response.body),
      );
    } else {
      print(json.decode(response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<Coupon> postCoupon(String coupon) async {
    final url = Uri.parse(baseUrl + '/checkCoupon');

    GetTokenDatabase? token = await userDao.getUserToken();

    print("token coupon = " + token!.getToken!);

    final http.Response response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ' + token.getToken!},
      body: {
        'coupon': coupon,
      },
    );
    print("response coupon ${response.body}");

    if (response.statusCode == 200) {
      return Coupon.fromJson(
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
