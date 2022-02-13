class RecommendedProductsDataSubCategory {
/*
{
  "id": 14,
  "order": 1,
  "slug": "Travel Mug",
  "icon": "http://adphp.coffepidia.com/files/4856718(1).png",
  "name": "Travel Mug"
}
*/

  int? id;
  int? order;
  String? slug;
  String? icon;
  String? name;

  RecommendedProductsDataSubCategory({
    this.id,
    this.order,
    this.slug,
    this.icon,
    this.name,
  });
  RecommendedProductsDataSubCategory.fromJson(Map<String, dynamic> json) {
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

class RecommendedProductsDataCategory {
/*
{
  "id": 13,
  "order": 1,
  "slug": "Accessories",
  "icon": "http://adphp.coffepidia.com/files/computer-icons-clip-art-computer-file-scalable-vector-graphics-portable-network-graphics-png-favpng-RbgLxHPfaU1WDRFLUhVwSX8By.jpg",
  "name": "Accessories"
}
*/

  int? id;
  int? order;
  String? slug;
  String? icon;
  String? name;

  RecommendedProductsDataCategory({
    this.id,
    this.order,
    this.slug,
    this.icon,
    this.name,
  });
  RecommendedProductsDataCategory.fromJson(Map<String, dynamic> json) {
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

class RecommendedProductsDataOverview2 {
/*
{
  "region": "Regions 1",
  "brand": "First Brand",
  "roast": "Roasts 1",
  "flavor": "Flavor 2"
}
*/

  String? region;
  String? brand;
  String? roast;
  String? flavor;

  RecommendedProductsDataOverview2({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  RecommendedProductsDataOverview2.fromJson(Map<String, dynamic> json) {
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

class RecommendedProductsDataOverview {
/*
{
  "region": "Regions 1",
  "brand": "First Brand",
  "roast": "Roasts 1",
  "flavor": "Flavor 2"
}
*/

  String? region;
  String? brand;
  String? roast;
  String? flavor;

  RecommendedProductsDataOverview({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  RecommendedProductsDataOverview.fromJson(Map<String, dynamic> json) {
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

class RecommendedProductsDataVendor {
/*
{
  "id": 61,
  "logo": "https://api-staging.coffepidia.com/saved_images/logo/8XxG4OE8eDPhdD5cHyOFkJkr9M9b8VND8AZ9h3bn.jpg",
  "feature": [
    "Takeaway"
  ],
  "company_name": "my comamy",
  "cover_photo": "https://api-staging.coffepidia.com/saved_images/cover_photo/tVHLNO9XqmHo4CYFufWD7iZegswXTdjf0zNh4waZ.jpg",
  "description": null,
  "address": "Address English",
  "map": null
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

  RecommendedProductsDataVendor({
    this.id,
    this.logo,
    this.feature,
    this.companyName,
    this.coverPhoto,
    this.description,
    this.address,
    this.map,
  });
  RecommendedProductsDataVendor.fromJson(Map<String, dynamic> json) {
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

class RecommendedProductsData {
/*
{
  "id": 123,
  "description": "<p>Discription English. dd dd dd .</p>",
  "name": "Title for our new vendor",
  "rate": null,
  "discount": 20,
  "price_before_discount": 120,
  "flavor_id": 2,
  "region_id": 1,
  "roast_id": 1,
  "brand_id": 1,
  "vendor_id": 61,
  "image": "https://api-staging.coffepidia.com/saved_images/products/61ee6e446bbec.png",
  "vendor": {
    "id": 61,
    "logo": "https://api-staging.coffepidia.com/saved_images/logo/8XxG4OE8eDPhdD5cHyOFkJkr9M9b8VND8AZ9h3bn.jpg",
    "feature": [
      "Takeaway"
    ],
    "company_name": "my comamy",
    "cover_photo": "https://api-staging.coffepidia.com/saved_images/cover_photo/tVHLNO9XqmHo4CYFufWD7iZegswXTdjf0zNh4waZ.jpg",
    "description": null,
    "address": "Address English",
    "map": null
  },
  "overview": {
    "region": "Regions 1",
    "brand": "First Brand",
    "roast": "Roasts 1",
    "flavor": "Flavor 2"
  },
  "overview2": {
    "region": "Regions 1",
    "brand": "First Brand",
    "roast": "Roasts 1",
    "flavor": "Flavor 2"
  },
  "price": 100,
  "stock": 121,
  "in_wishlist": false,
  "category": {
    "id": 13,
    "order": 1,
    "slug": "Accessories",
    "icon": "http://adphp.coffepidia.com/files/computer-icons-clip-art-computer-file-scalable-vector-graphics-portable-network-graphics-png-favpng-RbgLxHPfaU1WDRFLUhVwSX8By.jpg",
    "name": "Accessories"
  },
  "sub_category": {
    "id": 14,
    "order": 1,
    "slug": "Travel Mug",
    "icon": "http://adphp.coffepidia.com/files/4856718(1).png",
    "name": "Travel Mug"
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
  RecommendedProductsDataVendor? vendor;
  RecommendedProductsDataOverview? overview;
  RecommendedProductsDataOverview2? overview2;
  int? price;
  int? stock;
  bool? inWishlist;
  RecommendedProductsDataCategory? category;
  RecommendedProductsDataSubCategory? subCategory;

  RecommendedProductsData({
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
    this.overview,
    this.overview2,
    this.price,
    this.stock,
    this.inWishlist,
    this.category,
    this.subCategory,
  });
  RecommendedProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    description = json['description']?.toString();
    name = json['name']?.toString();
    rate = json['rate'] == null ? 0 : json['rate'].toInt;
    discount = json['discount'] == null ? 0 : json['discount'].toInt();
    priceBeforeDiscount = json['price_before_discount']?.toInt();
    flavorId = json['flavor_id']?.toInt();
    regionId = json['region_id']?.toInt();
    roastId = json['roast_id']?.toInt();
    brandId = json['brand_id']?.toInt();
    vendorId = json['vendor_id']?.toInt();
    image = json['image']?.toString();
    vendor = (json['vendor'] != null)
        ? RecommendedProductsDataVendor.fromJson(json['vendor'])
        : null;
    overview = (json['overview'] != null)
        ? RecommendedProductsDataOverview.fromJson(json['overview'])
        : null;
    overview2 = (json['overview2'] != null)
        ? RecommendedProductsDataOverview2.fromJson(json['overview2'])
        : null;
    price = json['price']?.toInt();
    stock = json['stock']?.toInt();
    inWishlist = json['in_wishlist'];
    category = (json['category'] != null)
        ? RecommendedProductsDataCategory.fromJson(json['category'])
        : null;
    subCategory = (json['sub_category'] != null)
        ? RecommendedProductsDataSubCategory.fromJson(json['sub_category'])
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
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    if (overview2 != null) {
      data['overview2'] = overview2!.toJson();
    }
    data['price'] = price;
    data['stock'] = stock;
    data['in_wishlist'] = inWishlist;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subCategory != null) {
      data['sub_category'] = subCategory!.toJson();
    }
    return data;
  }
}

class RecommendedProducts {
/*
{
  "data": [
    {
      "id": 123,
      "description": "<p>Discription English. dd dd dd .</p>",
      "name": "Title for our new vendor",
      "rate": null,
      "discount": 20,
      "price_before_discount": 120,
      "flavor_id": 2,
      "region_id": 1,
      "roast_id": 1,
      "brand_id": 1,
      "vendor_id": 61,
      "image": "https://api-staging.coffepidia.com/saved_images/products/61ee6e446bbec.png",
      "vendor": {
        "id": 61,
        "logo": "https://api-staging.coffepidia.com/saved_images/logo/8XxG4OE8eDPhdD5cHyOFkJkr9M9b8VND8AZ9h3bn.jpg",
        "feature": [
          "Takeaway"
        ],
        "company_name": "my comamy",
        "cover_photo": "https://api-staging.coffepidia.com/saved_images/cover_photo/tVHLNO9XqmHo4CYFufWD7iZegswXTdjf0zNh4waZ.jpg",
        "description": null,
        "address": "Address English",
        "map": null
      },
      "overview": {
        "region": "Regions 1",
        "brand": "First Brand",
        "roast": "Roasts 1",
        "flavor": "Flavor 2"
      },
      "overview2": {
        "region": "Regions 1",
        "brand": "First Brand",
        "roast": "Roasts 1",
        "flavor": "Flavor 2"
      },
      "price": 100,
      "stock": 121,
      "in_wishlist": false,
      "category": {
        "id": 13,
        "order": 1,
        "slug": "Accessories",
        "icon": "http://adphp.coffepidia.com/files/computer-icons-clip-art-computer-file-scalable-vector-graphics-portable-network-graphics-png-favpng-RbgLxHPfaU1WDRFLUhVwSX8By.jpg",
        "name": "Accessories"
      },
      "sub_category": {
        "id": 14,
        "order": 1,
        "slug": "Travel Mug",
        "icon": "http://adphp.coffepidia.com/files/4856718(1).png",
        "name": "Travel Mug"
      }
    }
  ]
}
*/

  List<RecommendedProductsData?>? data;

  RecommendedProducts({
    this.data,
  });
  RecommendedProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <RecommendedProductsData>[];
      v.forEach((v) {
        arr0.add(RecommendedProductsData.fromJson(v));
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
