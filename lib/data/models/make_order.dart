class MakeOrderData {
/*
{
  "msg": "order_created_successfully",
  "orderId": 12
}
*/

  String? msg;
  int? orderId;

  MakeOrderData({
    this.msg,
    this.orderId,
  });
  MakeOrderData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
    orderId = json['orderId']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    data['orderId'] = orderId;
    return data;
  }
}

class MakeOrder {
/*
{
  "data": {
    "msg": "order_created_successfully",
    "orderId": 12
  }
}
*/

  MakeOrderData? data;

  MakeOrder({
    this.data,
  });
  MakeOrder.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? MakeOrderData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
