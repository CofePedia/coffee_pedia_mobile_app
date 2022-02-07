class MostRecentDataPaginate {
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

  MostRecentDataPaginate({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });
  MostRecentDataPaginate.fromJson(Map<String, dynamic> json) {
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

class MostRecentDataDataOverview {
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

  MostRecentDataDataOverview({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  MostRecentDataDataOverview.fromJson(Map<String, dynamic> json) {
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

class MostRecentDataData {
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
  "vendor_id": 0,
  "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
  "vendor": "",
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
  String? vendor;
  MostRecentDataDataOverview? overview;
  int? price;
  int? stock;
  bool? inWishlist;

  MostRecentDataData({
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
  });
  MostRecentDataData.fromJson(Map<String, dynamic> json) {
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
    vendor = json['vendor']?.toString();
    overview = (json['overview'] != null)
        ? MostRecentDataDataOverview.fromJson(json['overview'])
        : null;
    price = json['price']?.toInt();
    stock = json['stock']?.toInt();
    inWishlist = json['in_wishlist'];
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
    data['vendor'] = vendor;
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    data['price'] = price;
    data['stock'] = stock;
    data['in_wishlist'] = inWishlist;
    return data;
  }
}

class MostRecentData {
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
      "vendor_id": 0,
      "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
      "vendor": "",
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

  List<MostRecentDataData?>? data;
  MostRecentDataPaginate? paginate;

  MostRecentData({
    this.data,
    this.paginate,
  });
  MostRecentData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <MostRecentDataData>[];
      v.forEach((v) {
        arr0.add(MostRecentDataData.fromJson(v));
      });
      this.data = arr0;
    }
    paginate = (json['paginate'] != null)
        ? MostRecentDataPaginate.fromJson(json['paginate'])
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

class MostRecent {
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
        "vendor_id": 0,
        "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
        "vendor": "",
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

  MostRecentData? data;

  MostRecent({
    this.data,
  });
  MostRecent.fromJson(Map<String, dynamic> json) {
    data =
        (json['data'] != null) ? MostRecentData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
