
class AddToBasketDataMsg {
/*
{
  "message": "product_has_been_added_to_your_cart",
  "product_id": 1
}
*/

  String? message;
  int? productId;

  AddToBasketDataMsg({
    this.message,
    this.productId,
  });
  AddToBasketDataMsg.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
    productId = json['product_id']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['product_id'] = productId;
    return data;
  }
}

class AddToBasketData {
/*
{
  "msg": [
    {
      "message": "product_has_been_added_to_your_cart",
      "product_id": 1
    }
  ]
}
*/

  List<AddToBasketDataMsg?>? msg;

  AddToBasketData({
    this.msg,
  });
  AddToBasketData.fromJson(Map<String, dynamic> json) {
    if (json['msg'] != null) {
      final v = json['msg'];
      final arr0 = <AddToBasketDataMsg>[];
      v.forEach((v) {
        arr0.add(AddToBasketDataMsg.fromJson(v));
      });
      msg = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (msg != null) {
      final v = msg;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['msg'] = arr0;
    }
    return data;
  }
}

class AddToBasket {
/*
{
  "data": {
    "msg": [
      {
        "message": "product_has_been_added_to_your_cart",
        "product_id": 1
      }
    ]
  }
}
*/

  AddToBasketData? data;

  AddToBasket({
    this.data,
  });
  AddToBasket.fromJson(Map<String, dynamic> json) {
    data =
        (json['data'] != null) ? AddToBasketData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
