class OrderSummaryData {
/*
{
  "sub_total": 2090,
  "discount": 0,
  "delivery_charge": 30,
  "total": 2120,
  "totalItems": 1
}
*/

  int? subTotal;
  int? discount;
  int? deliveryCharge;
  int? total;
  int? totalItems;

  OrderSummaryData({
    this.subTotal,
    this.discount,
    this.deliveryCharge,
    this.total,
    this.totalItems,
  });
  OrderSummaryData.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total']?.toInt();
    discount = json['discount'] == null ? 0 : json['discount'].toInt();
    deliveryCharge =
        json['delivery_charge'] == null ? 0 : json['delivery_charge'].toInt();
    total = json['total']?.toInt();
    totalItems = json['totalItems']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sub_total'] = subTotal;
    data['discount'] = discount;
    data['delivery_charge'] = deliveryCharge;
    data['total'] = total;
    data['totalItems'] = totalItems;
    return data;
  }
}

class OrderSummary {
/*
{
  "data": {
    "sub_total": 2090,
    "discount": 0,
    "delivery_charge": 30,
    "total": 2120,
    "totalItems": 1
  }
}
*/

  OrderSummaryData? data;

  OrderSummary({
    this.data,
  });
  OrderSummary.fromJson(Map<String, dynamic> json) {
    data =
        (json['data'] != null) ? OrderSummaryData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
