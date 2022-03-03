class MakeOrderData {
/*
{
  "msg": "order Created Successfully",
  "orderId": 95,
  "cashierUrl": "https://sandboxcashier.opaycheckout.com/apiCashier/redirect/payment/opaycheckout?orderToken=TOKEN.a637825e9e7247f7801270b4a968f193"
}
*/

  String? msg;
  int? orderId;
  String? cashierUrl;

  MakeOrderData({
    this.msg,
    this.orderId,
    this.cashierUrl,
  });
  MakeOrderData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
    orderId = json['orderId']?.toInt();
    cashierUrl = json['cashierUrl']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    data['orderId'] = orderId;
    data['cashierUrl'] = cashierUrl;
    return data;
  }
}

class MakeOrder {
/*
{
  "data": {
    "msg": "order Created Successfully",
    "orderId": 95,
    "cashierUrl": "https://sandboxcashier.opaycheckout.com/apiCashier/redirect/payment/opaycheckout?orderToken=TOKEN.a637825e9e7247f7801270b4a968f193"
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
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
