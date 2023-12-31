class FeaturedProductsDataPaginate {
/*
{
  "currentPage": 1,
  "lastPage": 5,
  "perPage": 15,
  "total": 66
}
*/

  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  FeaturedProductsDataPaginate({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });
  FeaturedProductsDataPaginate.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage']?.toInt();
    lastPage = json['lastPage']?.toInt();
    perPage = json['perPage']?.toInt();
    total = json['total']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['lastPage'] = lastPage;
    data['perPage'] = perPage;
    data['total'] = total;
    return data;
  }
}

class FeaturedProductsDataDataOverview {
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

  FeaturedProductsDataDataOverview({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  FeaturedProductsDataDataOverview.fromJson(Map<String, dynamic> json) {
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

class FeaturedProductsDataDataVendor {
/*
{
  "id": 61,
  "first_name": "admin",
  "last_name": "Admin",
  "logo": "https://api-staging.coffepidia.com/logo/61ee87df8718d.jpg",
  "name": "admin Admin",
  "feature": null,
  "company_name": "my comamy",
  "comapany_phone_number": "01151987369",
  "cover_photo": "",
  "description": null,
  "address": "Address English",
  "map": null
}
*/

  int? id;
  String? firstName;
  String? lastName;
  String? logo;
  String? name;
  String? feature;
  String? companyName;
  String? comapanyPhoneNumber;
  String? coverPhoto;
  String? description;
  String? address;
  String? map;

  FeaturedProductsDataDataVendor({
    this.id,
    this.firstName,
    this.lastName,
    this.logo,
    this.name,
    this.feature,
    this.companyName,
    this.comapanyPhoneNumber,
    this.coverPhoto,
    this.description,
    this.address,
    this.map,
  });
  FeaturedProductsDataDataVendor.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    logo = json['logo']?.toString();
    name = json['name']?.toString();
    feature = json['feature']?.toString();
    companyName = json['company_name']?.toString();
    comapanyPhoneNumber = json['comapany_phone_number']?.toString();
    coverPhoto = json['cover_photo']?.toString();
    description = json['description']?.toString();
    address = json['address']?.toString();
    map = json['map']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['logo'] = logo;
    data['name'] = name;
    data['feature'] = feature;
    data['company_name'] = companyName;
    data['comapany_phone_number'] = comapanyPhoneNumber;
    data['cover_photo'] = coverPhoto;
    data['description'] = description;
    data['address'] = address;
    data['map'] = map;
    return data;
  }
}

class FeaturedProductsDataData {
/*
{
  "id": 1,
  "description": "Autem tenetur quia quidem laboriosam maxime",
  "name": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
  "rate": 5,
  "discount": 50,
  "price_before_discount": 615,
  "flavor_id": 1,
  "region_id": 1,
  "roast_id": 1,
  "brand_id": 1,
  "vendor_id": 61,
  "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
  "vendor": {
    "id": 61,
    "first_name": "admin",
    "last_name": "Admin",
    "logo": "https://api-staging.coffepidia.com/logo/61ee87df8718d.jpg",
    "name": "admin Admin",
    "feature": null,
    "company_name": "my comamy",
    "comapany_phone_number": "01151987369",
    "cover_photo": "",
    "description": null,
    "address": "Address English",
    "map": null
  },
  "overview": {
    "region": "Regions 1",
    "brand": "First Brand",
    "roast": "Roasts 1",
    "flavor": "Flavor 1"
  },
  "price": 415,
  "stock": 19,
  "in_wishlist": false
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
  FeaturedProductsDataDataVendor? vendor;
  FeaturedProductsDataDataOverview? overview;
  int? price;
  int? stock;
  bool? inWishlist;
  bool? inCart;

  FeaturedProductsDataData({
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
    this.inCart,
  });
  FeaturedProductsDataData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    description = json['description']?.toString();
    name = json['name']?.toString();
    rate = json['rate'] == null ? 0 : json['rate'].toInt();
    discount = json['discount'] == null ? 0 : json['discount'].toInt();
    priceBeforeDiscount = json['price_before_discount'] == null
        ? 0
        : json['price_before_discount'].toInt();
    flavorId = json['flavor_id']?.toInt();
    regionId = json['region_id']?.toInt();
    roastId = json['roast_id']?.toInt();
    brandId = json['brand_id']?.toInt();
    vendorId = json['vendor_id']?.toInt();
    image = json['image']?.toString();
    vendor = (json['vendor'] != null)
        ? FeaturedProductsDataDataVendor.fromJson(json['vendor'])
        : null;
    overview = (json['overview'] != null)
        ? FeaturedProductsDataDataOverview.fromJson(json['overview'])
        : null;
    price = json['price'] == null ? 0 : json['price'].toInt();
    stock = json['stock']?.toInt();
    inWishlist = json['in_wishlist'];
    inCart = json['in_cart'];
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
    data['in_cart'] = inCart;

    return data;
  }
}

class FeaturedProductsData {
/*
{
  "data": [
    {
      "id": 1,
      "description": "Autem tenetur quia quidem laboriosam maxime",
      "name": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
      "rate": 5,
      "discount": 50,
      "price_before_discount": 615,
      "flavor_id": 1,
      "region_id": 1,
      "roast_id": 1,
      "brand_id": 1,
      "vendor_id": 61,
      "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
      "vendor": {
        "id": 61,
        "first_name": "admin",
        "last_name": "Admin",
        "logo": "https://api-staging.coffepidia.com/logo/61ee87df8718d.jpg",
        "name": "admin Admin",
        "feature": null,
        "company_name": "my comamy",
        "comapany_phone_number": "01151987369",
        "cover_photo": "",
        "description": null,
        "address": "Address English",
        "map": null
      },
      "overview": {
        "region": "Regions 1",
        "brand": "First Brand",
        "roast": "Roasts 1",
        "flavor": "Flavor 1"
      },
      "price": 415,
      "stock": 19,
      "in_wishlist": false
    }
  ],
  "paginate": {
    "currentPage": 1,
    "lastPage": 5,
    "perPage": 15,
    "total": 66
  }
}
*/

  List<FeaturedProductsDataData?>? data;
  FeaturedProductsDataPaginate? paginate;

  FeaturedProductsData({
    this.data,
    this.paginate,
  });
  FeaturedProductsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <FeaturedProductsDataData>[];
      v.forEach((v) {
        arr0.add(FeaturedProductsDataData.fromJson(v));
      });
      this.data = arr0;
    }
    paginate = (json['paginate'] != null)
        ? FeaturedProductsDataPaginate.fromJson(json['paginate'])
        : null;
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
    if (paginate != null) {
      data['paginate'] = paginate!.toJson();
    }
    return data;
  }
}

class FeaturedProducts {
/*
{
  "data": {
    "data": [
      {
        "id": 1,
        "description": "Autem tenetur quia quidem laboriosam maxime",
        "name": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
        "rate": 5,
        "discount": 50,
        "price_before_discount": 615,
        "flavor_id": 1,
        "region_id": 1,
        "roast_id": 1,
        "brand_id": 1,
        "vendor_id": 61,
        "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
        "vendor": {
          "id": 61,
          "first_name": "admin",
          "last_name": "Admin",
          "logo": "https://api-staging.coffepidia.com/logo/61ee87df8718d.jpg",
          "name": "admin Admin",
          "feature": null,
          "company_name": "my comamy",
          "comapany_phone_number": "01151987369",
          "cover_photo": "",
          "description": null,
          "address": "Address English",
          "map": null
        },
        "overview": {
          "region": "Regions 1",
          "brand": "First Brand",
          "roast": "Roasts 1",
          "flavor": "Flavor 1"
        },
        "price": 415,
        "stock": 19,
        "in_wishlist": false
      }
    ],
    "paginate": {
      "currentPage": 1,
      "lastPage": 5,
      "perPage": 15,
      "total": 66
    }
  }
}
*/

  FeaturedProductsData? data;

  FeaturedProducts({
    this.data,
  });
  FeaturedProducts.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? FeaturedProductsData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
