import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/add_to_basket.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/coupon.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/order_summary.dart';
import 'package:coffepedia/data/models/remove_from_basket.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class BasketWebServices {
  final userDao = UserDao();

  Future<Basket> getBasket() async {
    final url = Uri.parse(baseUrl + 'cart');
    GetTokenDatabase? token = await userDao.getUserToken();

    final http.Response response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response Basket ${response.body}");

    if (response.statusCode == 200) {
      final result = Basket.fromJson(
        json.decode(response.body),
      );

      return result;
    } else {
      print("response.body = " + (response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<AddToBasket> getAddToBasket(List<Map<String, int>> productsMap) async {
    GetTokenDatabase? token = await userDao.getUserToken();
    var headers = {
      'Authorization': 'Bearer ' + token!.getToken!,
      'Content-Type': 'application/json',
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    };

    var request = http.Request('POST', Uri.parse(baseUrl + '/cart/add'));
    request.body = json.encode({"products": productsMap});
    request.headers.addAll(headers);
    final response = await request.send();
    final http.Response res = await http.Response.fromStream(response);
    print("Response Add to Cart ${res.body}");
    if (response.statusCode == 200) {
      final basket = AddToBasket.fromJson(
        json.decode(res.body),
      );
      // List.generate(basket.data!.msg!.length, (index) {
      //   BotToast.showText(onlyOne: false,
      //     text:
      //         '${basket.data!.msg![index]!.productId} ${basket.data!.msg![index]!.message!}',
      //   );
      //   print(
      //       'jbdv ${basket.data!.msg![index]!.productId} ${basket.data!.msg![index]!.message!}');
      // });

      for (int x = 0; x < basket.data!.msg!.length; x++) {
        BotToast.showText(
          clickClose: true,
          onlyOne: false,
          text:
              '${basket.data!.msg![x]!.productId} ${basket.data!.msg![x]!.message!}',
        );
      }

      // BotToast.showText(
      //   text: basket.data!.msg![x]!.message!,
      // );
      // Future.delayed(Duration(seconds: 1));
      // print(
      //   'jbgds ${basket.data!.msg![x]!.productId!} ${basket.data!.msg![x]!.message!}',
      // );
      // }

      return basket;
    } else {
      throw Exception(
        AddToBasket.fromJson(json.decode(res.body)),
      );
    }
  }

  Future<AddToBasket> getAddToCartByItem(int productId, int quantity) async {
    GetTokenDatabase? token = await userDao.getUserToken();
    var headers = {
      'Authorization': 'Bearer ' + token!.getToken!,
      'Content-Type': 'application/json',
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    };

    var request = http.Request('POST', Uri.parse(baseUrl + '/cart_add_item'));
    request.body = json.encode({
      "product_id": productId,
      "quantity": quantity,
    });
    request.headers.addAll(headers);
    final response = await request.send();
    final http.Response res = await http.Response.fromStream(response);
    print('Response Add to Cart by Item ${res.body}');
    if (response.statusCode == 200) {
      return AddToBasket.fromJson(json.decode(res.body));
    } else {
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

  Future<Coupon> postCoupon(String coupon, String addressId) async {
    final url = Uri.parse(baseUrl + '/checkCoupon');

    GetTokenDatabase? token = await userDao.getUserToken();

    print("token coupon = " + token!.getToken!);

    final http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ' + token.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
      body: {'coupon': coupon, 'address_id': addressId},
    );
    print("response coupon ${response.body}");

    if (response.statusCode == 200) {
      return Coupon.fromJson(
        json.decode(response.body),
      );
    } else {
      final data = jsonDecode(response.body);
      data.forEach((key, value) {
        throw value[0];
      });
      throw 'Error, Please try again';
    }
  }

  Future<OrderSummary> postOrderSummary(String addressId) async {
    final url = Uri.parse(baseUrl + '/order_summary');

    GetTokenDatabase? token = await userDao.getUserToken();

    print("token order summary = " + token!.getToken!);

    final http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ' + token.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
      body: {
        'address_id': addressId,
      },
    );
    print("response order summary ${response.body}");

    if (response.statusCode == 200) {
      return OrderSummary.fromJson(
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
