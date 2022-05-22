class BrandProductsData {
/*
{
  "id": 64,
  "name": "Kimbo Armonia Capsules 10 pcs",
  "rate": 0,
  "discount": 0,
  "price_before_discount": 95,
  "image": "https://cofepedia.com/uploads/products/Kimbo-Armonia-Capsules.jpg",
  "price": 95,
  "in_wishlist": false
}
*/

  int? id;
  String? name;
  int? rate;
  int? discount;
  int? priceBeforeDiscount;
  String? image;
  int? price;
  bool? inWishlist;

  BrandProductsData({
    this.id,
    this.name,
    this.rate,
    this.discount,
    this.priceBeforeDiscount,
    this.image,
    this.price,
    this.inWishlist,
  });
  BrandProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name'] == null ? '' : json['name'].toString();
    rate = json['rate'] == null ? 0 : json['rate'].toInt();
    discount = json['discount'] == null ? 0 : json['discount'].toInt();
    priceBeforeDiscount = json['price_before_discount'] == null
        ? 0
        : json['price_before_discount'].toInt();
    image = json['image']?.toString();
    price = json['price'] == null ? 0 : json['price'].toInt();
    inWishlist = json['in_wishlist'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rate'] = rate;
    data['discount'] = discount;
    data['price_before_discount'] = priceBeforeDiscount;
    data['image'] = image;
    data['price'] = price;
    data['in_wishlist'] = inWishlist;
    return data;
  }
}

class BrandProducts {
/*
{
  "data": [
    {
      "id": 64,
      "name": "Kimbo Armonia Capsules 10 pcs",
      "rate": 0,
      "discount": 0,
      "price_before_discount": 95,
      "image": "https://cofepedia.com/uploads/products/Kimbo-Armonia-Capsules.jpg",
      "price": 95,
      "in_wishlist": false
    }
  ]
}
*/

  List<BrandProductsData?>? data;

  BrandProducts({
    this.data,
  });
  BrandProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <BrandProductsData>[];
      v.forEach((v) {
        arr0.add(BrandProductsData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    return data;
  }
}
