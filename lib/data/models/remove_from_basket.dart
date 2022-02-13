class RemoveFromBasketData {
/*
{
  "msg": "messages.product_has_been_removed_from_your_cart"
}
*/

  String? msg;

  RemoveFromBasketData({
    this.msg,
  });
  RemoveFromBasketData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class RemoveFromBasket {
/*
{
  "data": {
    "msg": "messages.product_has_been_removed_from_your_cart"
  }
}
*/

  RemoveFromBasketData? data;

  RemoveFromBasket({
    this.data,
  });
  RemoveFromBasket.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? RemoveFromBasketData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
