class BasketDataItems {
/*
{
  "id": 1,
  "title": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
  "rate": 36,
  "price_after_discount": 415,
  "discount": 50,
  "price_before_discount": 615,
  "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
  "quantity": 7,
  "total": 4305
}
*/

  int? id;
  String? title;
  int? rate;
  int? priceAfterDiscount;
  int? discount;
  int? priceBeforeDiscount;
  String? image;
  int? quantity;
  int? total;

  BasketDataItems({
    this.id,
    this.title,
    this.rate,
    this.priceAfterDiscount,
    this.discount,
    this.priceBeforeDiscount,
    this.image,
    this.quantity,
    this.total,
  });
  BasketDataItems.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    rate = json['rate']?.toInt();
    priceAfterDiscount = json['price_after_discount']?.toInt();
    discount = json['discount']?.toInt();
    priceBeforeDiscount = json['price_before_discount']?.toInt();
    image = json['image']?.toString();
    quantity = json['quantity']?.toInt();
    total = json['total']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['rate'] = rate;
    data['price_after_discount'] = priceAfterDiscount;
    data['discount'] = discount;
    data['price_before_discount'] = priceBeforeDiscount;
    data['image'] = image;
    data['quantity'] = quantity;
    data['total'] = total;
    return data;
  }
}

class BasketData {
/*
{
  "items": [
    {
      "id": 1,
      "title": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
      "rate": 36,
      "price_after_discount": 415,
      "discount": 50,
      "price_before_discount": 615,
      "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
      "quantity": 7,
      "total": 4305
    }
  ],
  "total": 4305,
  "totalItems": 8
}
*/

  List<BasketDataItems?>? items;
  int? total;
  int? totalItems;

  BasketData({
    this.items,
    this.total,
    this.totalItems,
  });
  BasketData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      final v = json['items'];
      final arr0 = <BasketDataItems>[];
      v.forEach((v) {
        arr0.add(BasketDataItems.fromJson(v));
      });
      items = arr0;
    }
    total = json['total']?.toInt();
    totalItems = json['totalItems']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (items != null) {
      final v = items;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['items'] = arr0;
    }
    data['total'] = total;
    data['totalItems'] = totalItems;
    return data;
  }
}

class Basket {
/*
{
  "data": {
    "items": [
      {
        "id": 1,
        "title": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
        "rate": 36,
        "price_after_discount": 415,
        "discount": 50,
        "price_before_discount": 615,
        "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
        "quantity": 7,
        "total": 4305
      }
    ],
    "total": 4305,
    "totalItems": 8
  }
}
*/

  BasketData? data;

  Basket({
    this.data,
  });
  Basket.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? BasketData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
