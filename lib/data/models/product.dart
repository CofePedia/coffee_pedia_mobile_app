class ProductDataCategory {
/*
{
  "id": 10,
  "order": 1,
  "slug": "Equipments",
  "icon": "http://adphp.coffepidia.com/files/coffee_equ.png",
  "name": "Equipment"
}
*/

  int? id;
  int? order;
  String? slug;
  String? icon;
  String? name;

  ProductDataCategory({
    this.id,
    this.order,
    this.slug,
    this.icon,
    this.name,
  });
  ProductDataCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    order = json['order']?.toInt();
    slug = json['slug']?.toString();
    icon = json['icon']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['order'] = order;
    data['slug'] = slug;
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

class ProductDataOverview2 {
/*
{
  "key": "brand",
  "value": "Wacaco"
}
*/

  String? key;
  String? value;

  ProductDataOverview2({
    this.key,
    this.value,
  });
  ProductDataOverview2.fromJson(Map<String, dynamic> json) {
    key = json['key']?.toString();
    value = json['value']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class ProductDataOverview {
/*
{
  "region": "",
  "brand": "Wacaco",
  "roast": "",
  "flavor": ""
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

class ProductDataVendor {
/*
{
  "id": 66,
  "logo": "",
  "feature": "",
  "company_name": "",
  "cover_photo": "",
  "description": "",
  "address": "",
  "map": ""
}
*/

  int? id;
  String? logo;
  String? feature;
  String? companyName;
  String? coverPhoto;
  String? description;
  String? address;
  String? map;

  ProductDataVendor({
    this.id,
    this.logo,
    this.feature,
    this.companyName,
    this.coverPhoto,
    this.description,
    this.address,
    this.map,
  });
  ProductDataVendor.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    logo = json['logo']?.toString();
    feature = json['feature']?.toString();
    companyName = json['company_name']?.toString();
    coverPhoto = json['cover_photo']?.toString();
    description = json['description']?.toString();
    address = json['address']?.toString();
    map = json['map']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['logo'] = logo;
    data['feature'] = feature;
    data['company_name'] = companyName;
    data['cover_photo'] = coverPhoto;
    data['description'] = description;
    data['address'] = address;
    data['map'] = map;
    return data;
  }
}

class ProductData {
/*
{
  "id": 35,
  "description": "<p>Packed with new features and capabilities, which will drastically improve the way you prepare your favorite coffee, Nanopresso is one of the best and most versatile espresso machines. A truly unique addition to your coffee toolkit! Built around a newly patented pumping system, the Nanopresso is capable of reaching, with the help of your hands, a maximum of 18 bars (261 PSI) of pressure for unparalleled coffee extractions qualities. The Nanopresso works best with finely ground coffee that is tamped hard. It is delightfully easy to operate and simple to use. The Nanopresso requires 15% less force to pump compared to previous models (1st generation Minipresso). With Nanopresso, the power is in the machine, not in your hands. After each shot, Nanopresso maintenance takes only a few seconds. When necessary, every components of the portafilter are easily separated for deep cleaning.</p>",
  "name": "Wacaco Nanopresso Ground Machine - Grey + Case",
  "rate": null,
  "discount": 0,
  "price_before_discount": 2090,
  "flavor_id": 0,
  "region_id": 0,
  "roast_id": 0,
  "brand_id": 2,
  "vendor_id": 66,
  "images": [
    "https://api-staging.coffepidia.com/saved_images/products/9627175095259247361_mq.jpg"
  ],
  "vendor": {
    "id": 66,
    "logo": "",
    "feature": "",
    "company_name": "",
    "cover_photo": "",
    "description": "",
    "address": "",
    "map": ""
  },
  "overview": {
    "region": "",
    "brand": "Wacaco",
    "roast": "",
    "flavor": ""
  },
  "overview2": {
    "brand": "Wacaco"
  },
  "price": 2090,
  "stock": 19,
  "in_wishlist": false,
  "category": {
    "id": 10,
    "order": 1,
    "slug": "Equipments",
    "icon": "http://adphp.coffepidia.com/files/coffee_equ.png",
    "name": "Equipment"
  },
  "sub_category": {
    "id": 11,
    "order": 1,
    "slug": "Coffee Machines",
    "icon": "http://adphp.coffepidia.com/files/coffee-machine-pngrepo-com.png",
    "name": "Coffee Machines"
  }
}
*/

  int? id;
  String? description;
  String? name;
  int? rate;
  int? discount;
  int? priceBeforeDiscount;
  int? flavorId;
  int? regionId;
  int? roastId;
  int? brandId;
  int? vendorId;
  List<String?>? images;
  ProductDataVendor? vendor;
  ProductDataOverview? overview;
  List<ProductDataOverview2?>? overview2;
  int? price;
  int? stock;
  bool? inWishlist;
  bool? inCart;
  ProductDataCategory? category;

  ProductData({
    this.id,
    this.description,
    this.name,
    this.rate,
    this.discount,
    this.priceBeforeDiscount,
    this.flavorId,
    this.regionId,
    this.roastId,
    this.brandId,
    this.vendorId,
    this.images,
    this.vendor,
    this.overview,
    this.overview2,
    this.price,
    this.stock,
    this.inWishlist,
    this.inCart,
    this.category,
  });
  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    description = json['description']?.toString();
    name = json['name']?.toString();
    rate = json['rate'] == null ? 0 : json['rate'].toInt();
    discount = json['discount'] == null ? 0 : json['discount'].toInt();
    priceBeforeDiscount = json['price_before_discount']?.toInt();
    flavorId = json['flavor_id']?.toInt();
    regionId = json['region_id']?.toInt();
    roastId = json['roast_id']?.toInt();
    brandId = json['brand_id']?.toInt();
    vendorId = json['vendor_id']?.toInt();
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
    vendor = (json['vendor'] != null)
        ? ProductDataVendor.fromJson(json['vendor'])
        : null;
    overview = (json['overview'] != null)
        ? ProductDataOverview.fromJson(json['overview'])
        : null;
    if (json['overview2'] != null) {
      final v = json['overview2'];
      final arr0 = <ProductDataOverview2>[];
      v.forEach((v) {
        arr0.add(ProductDataOverview2.fromJson(v));
      });
      overview2 = arr0;
    }
    price = json['price']?.toInt();
    stock = json['stock']?.toInt();
    inWishlist = json['in_wishlist'];
    inCart = json['in_cart'];

    category = (json['category'] != null)
        ? ProductDataCategory.fromJson(json['category'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['name'] = name;
    data['rate'] = rate;
    data['discount'] = discount;
    data['price_before_discount'] = priceBeforeDiscount;
    data['flavor_id'] = flavorId;
    data['region_id'] = regionId;
    data['roast_id'] = roastId;
    data['brand_id'] = brandId;
    data['vendor_id'] = vendorId;
    if (images != null) {
      final v = images;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['images'] = arr0;
    }
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    if (overview2 != null) {
      final v = overview2;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['overview2'] = arr0;
    }
    data['price'] = price;
    data['stock'] = stock;
    data['in_wishlist'] = inWishlist;
    data['in_cart'] = inCart;

    if (category != null) {
      data['category'] = category!.toJson();
    }

    return data;
  }
}

class Product {
/*
{
  "data": {
    "id": 35,
    "description": "<p>Packed with new features and capabilities, which will drastically improve the way you prepare your favorite coffee, Nanopresso is one of the best and most versatile espresso machines. A truly unique addition to your coffee toolkit! Built around a newly patented pumping system, the Nanopresso is capable of reaching, with the help of your hands, a maximum of 18 bars (261 PSI) of pressure for unparalleled coffee extractions qualities. The Nanopresso works best with finely ground coffee that is tamped hard. It is delightfully easy to operate and simple to use. The Nanopresso requires 15% less force to pump compared to previous models (1st generation Minipresso). With Nanopresso, the power is in the machine, not in your hands. After each shot, Nanopresso maintenance takes only a few seconds. When necessary, every components of the portafilter are easily separated for deep cleaning.</p>",
    "name": "Wacaco Nanopresso Ground Machine - Grey + Case",
    "rate": null,
    "discount": 0,
    "price_before_discount": 2090,
    "flavor_id": 0,
    "region_id": 0,
    "roast_id": 0,
    "brand_id": 2,
    "vendor_id": 66,
    "images": [
      "https://api-staging.coffepidia.com/saved_images/products/9627175095259247361_mq.jpg"
    ],
    "vendor": {
      "id": 66,
      "logo": "",
      "feature": "",
      "company_name": "",
      "cover_photo": "",
      "description": "",
      "address": "",
      "map": ""
    },
    "overview": {
      "region": "",
      "brand": "Wacaco",
      "roast": "",
      "flavor": ""
    },
    "overview2": {
      "brand": "Wacaco"
    },
    "price": 2090,
    "stock": 19,
    "in_wishlist": false,
    "category": {
      "id": 10,
      "order": 1,
      "slug": "Equipments",
      "icon": "http://adphp.coffepidia.com/files/coffee_equ.png",
      "name": "Equipment"
    },
    "sub_category": {
      "id": 11,
      "order": 1,
      "slug": "Coffee Machines",
      "icon": "http://adphp.coffepidia.com/files/coffee-machine-pngrepo-com.png",
      "name": "Coffee Machines"
    }
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
