class CouponDataCoupon {
/*
{
  "id": 1,
  "code": "Shad10",
  "discount": 0,
  "min_order": 80,
  "type": "percentage",
  "capping": 50
}
*/

  int? id;
  String? code;
  int? discount;
  int? minOrder;
  String? type;
  int? capping;

  CouponDataCoupon({
    this.id,
    this.code,
    this.discount,
    this.minOrder,
    this.type,
    this.capping,
  });
  CouponDataCoupon.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    code = json['code']?.toString();
    discount = json['discount']?.toInt();
    minOrder = json['min_order']?.toInt();
    type = json['type']?.toString();
    capping = json['capping']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['discount'] = discount;
    data['min_order'] = minOrder;
    data['type'] = type;
    data['capping'] = capping;
    return data;
  }
}

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

  CouponDataCoupon? coupon;
  int? subTotal;
  int? discount;
  int? deliveryCharge;
  int? totalPrice;

  CouponData({
    this.coupon,
    this.subTotal,
    this.discount,
    this.deliveryCharge,
    this.totalPrice,
  });
  CouponData.fromJson(Map<String, dynamic> json) {
    coupon = (json['coupon'] != null)
        ? CouponDataCoupon.fromJson(json['coupon'])
        : null;
    subTotal = json['sub_total']?.toInt();
    discount = json['discount']?.toInt();
    deliveryCharge = json['delivery_charge']?.toInt();
    totalPrice = json['total_price']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
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
