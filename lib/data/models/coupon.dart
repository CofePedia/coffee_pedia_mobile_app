class CouponData {
/*
{
  "coupon": {
    "id": 1,
    "code": "Shad10",
    "discount": 0,
    "min_order": 80,
    "type": "percentage",
    "capping": 50
  },
  "sub_total": 2890,
  "discount": 0,
  "delivery_charge": 0,
  "total_price": 2890
}
*/

  int? subTotal;
  int? discount;
  int? deliveryCharge;
  int? totalPrice;

  CouponData({
    this.subTotal,
    this.discount,
    this.deliveryCharge,
    this.totalPrice,
  });
  CouponData.fromJson(Map<String, dynamic> json) {
    subTotal = json['sub_total']?.toInt();
    discount = json['discount'] == null ? 0 : json['discount'].toInt();
    deliveryCharge =
        json['delivery_charge'] == null ? 0 : json['delivery_charge'].toInt();
    totalPrice = json['total_price']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['sub_total'] = subTotal;
    data['discount'] = discount;
    data['delivery_charge'] = deliveryCharge;
    data['total_price'] = totalPrice;
    return data;
  }
}

class Coupon {
/*
{
  "data": {
    "coupon": {
      "id": 1,
      "code": "Shad10",
      "discount": 0,
      "min_order": 80,
      "type": "percentage",
      "capping": 50
    },
    "sub_total": 2890,
    "discount": 0,
    "delivery_charge": 0,
    "total_price": 2890
  }
}
*/

  CouponData? data;

  Coupon({
    this.data,
  });
  Coupon.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? CouponData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
