class ProductDataImages {
/*
{
  "id": 1,
  "url": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
}
*/

  int? id;
  String? url;

  ProductDataImages({
    this.id,
    this.url,
  });
  ProductDataImages.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}

class ProductDataOverview {
/*
{
  "region": "Regions 1",
  "brand": "First Brand",
  "roast": "Roasts 1",
  "flavor": "Flavor 1"
}
*/

  String? region;
  String? brand;
  String? roast;
  String? flavor;

  ProductDataOverview({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  ProductDataOverview.fromJson(Map<String, dynamic> json) {
    region = json['region']?.toString();
    brand = json['brand']?.toString();
    roast = json['roast']?.toString();
    flavor = json['flavor']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['region'] = region;
    data['brand'] = brand;
    data['roast'] = roast;
    data['flavor'] = flavor;
    return data;
  }
}

class ProductData {
/*
{
  "id": 1,
  "description": "",
  "title": "",
  "rate": 36,
  "discount": 50,
  "price_before_discount": 615,
  "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
  "price": "415",
  "overview": {
    "region": "Regions 1",
    "brand": "First Brand",
    "roast": "Roasts 1",
    "flavor": "Flavor 1"
  },
  "images": [
    {
      "id": 1,
      "url": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
    }
  ],
  "vendor": null
}
*/

  int? id;
  String? description;
  String? title;
  int? rate;
  int? discount;
  int? priceBeforeDiscount;
  String? image;
  String? price;
  ProductDataOverview? overview;
  List<ProductDataImages?>? images;
  String? vendor;

  ProductData({
    this.id,
    this.description,
    this.title,
    this.rate,
    this.discount,
    this.priceBeforeDiscount,
    this.image,
    this.price,
    this.overview,
    this.images,
    this.vendor,
  });
  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    description = json['description']?.toString();
    title = json['title']?.toString();
    rate = json['rate']?.toInt();
    discount = json['discount']?.toInt();
    priceBeforeDiscount = json['price_before_discount']?.toInt();
    image = json['image']?.toString();
    price = json['price']?.toString();
    overview = (json['overview'] != null) ? ProductDataOverview.fromJson(json['overview']) : null;
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <ProductDataImages>[];
      v.forEach((v) {
        arr0.add(ProductDataImages.fromJson(v));
      });
      images = arr0;
    }
    vendor = json['vendor']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['title'] = title;
    data['rate'] = rate;
    data['discount'] = discount;
    data['price_before_discount'] = priceBeforeDiscount;
    data['image'] = image;
    data['price'] = price;
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    if (images != null) {
      final v = images;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['images'] = arr0;
    }
    data['vendor'] = vendor;
    return data;
  }
}

class Product {
/*
{
  "data": {
    "id": 1,
    "description": "",
    "title": "",
    "rate": 36,
    "discount": 50,
    "price_before_discount": 615,
    "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
    "price": "415",
    "overview": {
      "region": "Regions 1",
      "brand": "First Brand",
      "roast": "Roasts 1",
      "flavor": "Flavor 1"
    },
    "images": [
      {
        "id": 1,
        "url": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
      }
    ],
    "vendor": null
  }
}
*/

  ProductData? data;

  Product({
    this.data,
  });
  Product.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? ProductData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
