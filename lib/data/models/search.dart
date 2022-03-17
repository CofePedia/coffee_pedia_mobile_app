class SearchDataCategory {
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

  SearchDataCategory({
    this.id,
    this.order,
    this.slug,
    this.icon,
    this.name,
  });
  SearchDataCategory.fromJson(Map<String, dynamic> json) {
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

class SearchDataVendor {
/*
{
  "id": 66,
  "logo": "",
  "feature": [
    "Takeaway"
  ],
  "company_name": "",
  "cover_photo": "",
  "description": "",
  "address": "",
  "map": ""
}
*/

  int? id;
  String? logo;
  List<String?>? feature;
  String? companyName;
  String? coverPhoto;
  String? description;
  String? address;
  String? map;

  SearchDataVendor({
    this.id,
    this.logo,
    this.feature,
    this.companyName,
    this.coverPhoto,
    this.description,
    this.address,
    this.map,
  });
  SearchDataVendor.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    logo = json['logo']?.toString();
    if (json['feature'] != null) {
      final v = json['feature'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      feature = arr0;
    }
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
    if (feature != null) {
      final v = feature;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['feature'] = arr0;
    }
    data['company_name'] = companyName;
    data['cover_photo'] = coverPhoto;
    data['description'] = description;
    data['address'] = address;
    data['map'] = map;
    return data;
  }
}

class SearchData {
/*
{
  "id": 35,
  "description": "<p>Packed with new features and capabilities, which will drastically improve the way you prepare your favorite coffee, Nanopresso is one of the best and most versatile espresso machines. A truly unique addition to your coffee toolkit! Built around a newly patented pumping system, the Nanopresso is capable of reaching, with the help of your hands, a maximum of 18 bars (261 PSI) of pressure for unparalleled coffee extractions qualities. The Nanopresso works best with finely ground coffee that is tamped hard. It is delightfully easy to operate and simple to use. The Nanopresso requires 15% less force to pump compared to previous models (1st generation Minipresso). With Nanopresso, the power is in the machine, not in your hands. After each shot, Nanopresso maintenance takes only a few seconds. When necessary, every components of the portafilter are easily separated for deep cleaning.</p>",
  "name": "Wacaco Nanopresso Ground Machine - Grey + Case",
  "rate": 4,
  "discount": 0,
  "price_before_discount": 2090,
  "flavor_id": 0,
  "region_id": 0,
  "roast_id": 0,
  "brand_id": 2,
  "vendor_id": 66,
  "image": "https://api-staging.coffepidia.com/saved_images/products/9627175095259247361_mq.jpg",
  "vendor": {
    "id": 66,
    "logo": "",
    "feature": [
      "Takeaway"
    ],
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
  String? image;
  SearchDataVendor? vendor;

  int? price;
  int? stock;
  bool? inWishlist;
  SearchDataCategory? category;

  SearchData({
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
    this.image,
    this.vendor,
    this.price,
    this.stock,
    this.inWishlist,
    this.category,
  });
  SearchData.fromJson(Map<String, dynamic> json) {
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
    image = json['image']?.toString();
    vendor = (json['vendor'] != null)
        ? SearchDataVendor.fromJson(json['vendor'])
        : null;

    price = json['price']?.toInt();
    stock = json['stock']?.toInt();
    inWishlist = json['in_wishlist'];
    category = (json['category'] != null)
        ? SearchDataCategory.fromJson(json['category'])
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
    data['image'] = image;
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }

    data['price'] = price;
    data['stock'] = stock;
    data['in_wishlist'] = inWishlist;
    if (category != null) {
      data['category'] = category!.toJson();
    }

    return data;
  }
}

class Search {
/*
{
  "data": [
    {
      "id": 35,
      "description": "<p>Packed with new features and capabilities, which will drastically improve the way you prepare your favorite coffee, Nanopresso is one of the best and most versatile espresso machines. A truly unique addition to your coffee toolkit! Built around a newly patented pumping system, the Nanopresso is capable of reaching, with the help of your hands, a maximum of 18 bars (261 PSI) of pressure for unparalleled coffee extractions qualities. The Nanopresso works best with finely ground coffee that is tamped hard. It is delightfully easy to operate and simple to use. The Nanopresso requires 15% less force to pump compared to previous models (1st generation Minipresso). With Nanopresso, the power is in the machine, not in your hands. After each shot, Nanopresso maintenance takes only a few seconds. When necessary, every components of the portafilter are easily separated for deep cleaning.</p>",
      "name": "Wacaco Nanopresso Ground Machine - Grey + Case",
      "rate": 4,
      "discount": 0,
      "price_before_discount": 2090,
      "flavor_id": 0,
      "region_id": 0,
      "roast_id": 0,
      "brand_id": 2,
      "vendor_id": 66,
      "image": "https://api-staging.coffepidia.com/saved_images/products/9627175095259247361_mq.jpg",
      "vendor": {
        "id": 66,
        "logo": "",
        "feature": [
          "Takeaway"
        ],
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
  ]
}
*/

  List<SearchData?>? data;

  Search({
    this.data,
  });
  Search.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <SearchData>[];
      v.forEach((v) {
        arr0.add(SearchData.fromJson(v));
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
