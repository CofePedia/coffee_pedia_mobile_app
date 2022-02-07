class WishlistDataSubCategory {
/*
{
  "id": 2,
  "order": 1,
  "slug": "men",
  "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
  "name": "Men"
}
*/

  int? id;
  int? order;
  String? slug;
  String? icon;
  String? name;

  WishlistDataSubCategory({
    this.id,
    this.order,
    this.slug,
    this.icon,
    this.name,
  });
  WishlistDataSubCategory.fromJson(Map<String, dynamic> json) {
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

class WishlistDataCategory {
/*
{
  "id": 1,
  "order": 1,
  "slug": "fashoin",
  "icon": "http://adphp.coffepidia.com/files/fashoin.png",
  "name": "Fashoin"
}
*/

  int? id;
  int? order;
  String? slug;
  String? icon;
  String? name;

  WishlistDataCategory({
    this.id,
    this.order,
    this.slug,
    this.icon,
    this.name,
  });
  WishlistDataCategory.fromJson(Map<String, dynamic> json) {
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

class WishlistDataOverview {
/*
{
  "region": "Regions 1",
  "brand": "First Brand",
  "roast": "Roasts 1",
  "flavor": "zczxcC"
}
*/

  String? region;
  String? brand;
  String? roast;
  String? flavor;

  WishlistDataOverview({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  WishlistDataOverview.fromJson(Map<String, dynamic> json) {
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

class WishlistDataVendor {
/*
{
  "id": 60,
  "logo": "https://api-staging.coffepidia.com/saved_images/logo/C3LkC99dd6986PV7gWVPmLVYQ0IhkrOKXg7E2lD6.jpg",
  "feature": null,
  "company_name": null,
  "cover_photo": "https://api-staging.coffepidia.com/saved_images/cover_photo/jdX3LnB38z1og51AAAnoXLt7hYmX9FyxX5vsKUzf.png",
  "description": null,
  "address": null,
  "map": null
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

  WishlistDataVendor({
    this.id,
    this.logo,
    this.feature,
    this.companyName,
    this.coverPhoto,
    this.description,
    this.address,
    this.map,
  });
  WishlistDataVendor.fromJson(Map<String, dynamic> json) {
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

class WishlistData {
/*
{
  "id": 1,
  "description": "<p>Autem tenetur quia quidem laboriosam maxime</p>",
  "name": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
  "rate": 5,
  "discount": 50,
  "price_before_discount": 615,
  "flavor_id": 3,
  "region_id": 1,
  "roast_id": 1,
  "brand_id": 1,
  "vendor_id": 60,
  "image": "https://api-staging.coffepidia.com/saved_images/products/JqqFLKZ6x3vvRy0YfT5745OdLbc3LCq9sR1Ishr5.jpg",
  "vendor": {
    "id": 60,
    "logo": "https://api-staging.coffepidia.com/saved_images/logo/C3LkC99dd6986PV7gWVPmLVYQ0IhkrOKXg7E2lD6.jpg",
    "feature": null,
    "company_name": null,
    "cover_photo": "https://api-staging.coffepidia.com/saved_images/cover_photo/jdX3LnB38z1og51AAAnoXLt7hYmX9FyxX5vsKUzf.png",
    "description": null,
    "address": null,
    "map": null
  },
  "overview": {
    "region": "Regions 1",
    "brand": "First Brand",
    "roast": "Roasts 1",
    "flavor": "zczxcC"
  },
  "price": 565,
  "stock": 19,
  "in_wishlist": true,
  "category": {
    "id": 1,
    "order": 1,
    "slug": "fashoin",
    "icon": "http://adphp.coffepidia.com/files/fashoin.png",
    "name": "Fashoin"
  },
  "sub_category": {
    "id": 2,
    "order": 1,
    "slug": "men",
    "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
    "name": "Men"
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
  WishlistDataVendor? vendor;
  WishlistDataOverview? overview;
  int? price;
  int? stock;
  bool? inWishlist;
  WishlistDataCategory? category;
  WishlistDataSubCategory? subCategory;

  WishlistData({
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
    this.price,
    this.stock,
    this.inWishlist,
    this.category,
    this.subCategory,
  });
  WishlistData.fromJson(Map<String, dynamic> json) {
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
        ? WishlistDataVendor.fromJson(json['vendor'])
        : null;
    overview = (json['overview'] != null)
        ? WishlistDataOverview.fromJson(json['overview'])
        : null;
    price = json['price']?.toInt();
    stock = json['stock']?.toInt();
    inWishlist = json['in_wishlist'];
    category = (json['category'] != null)
        ? WishlistDataCategory.fromJson(json['category'])
        : null;
    subCategory = (json['sub_category'] != null)
        ? WishlistDataSubCategory.fromJson(json['sub_category'])
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

class Wishlist {
/*
{
  "data": [
    {
      "id": 1,
      "description": "<p>Autem tenetur quia quidem laboriosam maxime</p>",
      "name": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
      "rate": 5,
      "discount": 50,
      "price_before_discount": 615,
      "flavor_id": 3,
      "region_id": 1,
      "roast_id": 1,
      "brand_id": 1,
      "vendor_id": 60,
      "image": "https://api-staging.coffepidia.com/saved_images/products/JqqFLKZ6x3vvRy0YfT5745OdLbc3LCq9sR1Ishr5.jpg",
      "vendor": {
        "id": 60,
        "logo": "https://api-staging.coffepidia.com/saved_images/logo/C3LkC99dd6986PV7gWVPmLVYQ0IhkrOKXg7E2lD6.jpg",
        "feature": null,
        "company_name": null,
        "cover_photo": "https://api-staging.coffepidia.com/saved_images/cover_photo/jdX3LnB38z1og51AAAnoXLt7hYmX9FyxX5vsKUzf.png",
        "description": null,
        "address": null,
        "map": null
      },
      "overview": {
        "region": "Regions 1",
        "brand": "First Brand",
        "roast": "Roasts 1",
        "flavor": "zczxcC"
      },
      "price": 565,
      "stock": 19,
      "in_wishlist": true,
      "category": {
        "id": 1,
        "order": 1,
        "slug": "fashoin",
        "icon": "http://adphp.coffepidia.com/files/fashoin.png",
        "name": "Fashoin"
      },
      "sub_category": {
        "id": 2,
        "order": 1,
        "slug": "men",
        "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
        "name": "Men"
      }
    }
  ]
}
*/

  List<WishlistData?>? data;

  Wishlist({
    this.data,
  });
  Wishlist.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <WishlistData>[];
      v.forEach((v) {
        arr0.add(WishlistData.fromJson(v));
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
