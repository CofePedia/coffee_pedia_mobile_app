class CategoryProductsDataFiltersOptions {
/*
{
  "id": 1,
  "slug": "aaaa",
  "name": "First Brand"
}
*/

  int? id;
  String? slug;
  String? name;

  CategoryProductsDataFiltersOptions({
    this.id,
    this.slug,
    this.name,
  });
  CategoryProductsDataFiltersOptions.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    slug = json['slug']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    return data;
  }
}

// TODO: check filters with backend

// class CategoryProductsDataFilters {
//   String? name;
//   String? key;
//   String? type;
//   List<CategoryProductsDataFiltersOptions>? options;
//
//   CategoryProductsDataFilters({this.name, this.key, this.type, this.options});
//
//   CategoryProductsDataFilters.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     key = json['key'];
//     type = json['type'];
//     if (json['options'] != null) {
//       options = <CategoryProductsDataFiltersOptions>[];
//       json['options'].forEach((v) {
//         options!.add(new CategoryProductsDataFiltersOptions.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['key'] = this.key;
//     data['type'] = this.type;
//     if (this.options != null) {
//       data['options'] = this.options!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class CategoryProductsDataSubCategory {
/*
{
  "id": 2,
  "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
  "name": "Men"
}
*/

  int? id;
  String? icon;
  String? name;

  CategoryProductsDataSubCategory({
    this.id,
    this.icon,
    this.name,
  });
  CategoryProductsDataSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    icon = json['icon']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

class CategoryProductsDataCategory {
/*
{
  "id": 1,
  "icon": "http://adphp.coffepidia.com/files/fashoin.png",
  "name": "Fashoin"
}
*/

  int? id;
  String? icon;
  String? name;

  CategoryProductsDataCategory({
    this.id,
    this.icon,
    this.name,
  });
  CategoryProductsDataCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    icon = json['icon']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

class CategoryProductsDataPaginate {
/*
{
  "currentPage": 1,
  "lastPage": 2,
  "perPage": 15,
  "total": 17
}
*/

  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  CategoryProductsDataPaginate({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });
  CategoryProductsDataPaginate.fromJson(Map<String, dynamic> json) {
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

class CategoryProductsDataDataOverview {
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

  CategoryProductsDataDataOverview({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  CategoryProductsDataDataOverview.fromJson(Map<String, dynamic> json) {
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

class CategoryProductsDataData {
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
  "images": [
    "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
  ],
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
  List<String?>? images;
  String? vendor;
  CategoryProductsDataDataOverview? overview;
  int? price;
  int? stock;
  bool? inWishlist;

  CategoryProductsDataData({
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
    this.price,
    this.stock,
    this.inWishlist,
  });
  CategoryProductsDataData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    description = json['description']?.toString();
    name = json['name']?.toString();
    rate = json['rate']?.toInt();
    discount = json['discount']?.toInt();
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
    vendor = json['vendor']?.toString();
    overview = (json['overview'] != null)
        ? CategoryProductsDataDataOverview.fromJson(json['overview'])
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
    if (images != null) {
      final v = images;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['images'] = arr0;
    }
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

class CategoryProductsData {
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
      "images": [
        "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
      ],
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
    "lastPage": 2,
    "perPage": 15,
    "total": 17
  },
  "category": {
    "id": 1,
    "icon": "http://adphp.coffepidia.com/files/fashoin.png",
    "name": "Fashoin"
  },
  "sub_category": [
    {
      "id": 2,
      "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
      "name": "Men"
    }
  ],
  "filters": [
    {
      "name": "Brands",
      "key": "brand",
      "type": "multi",
      "options": [
        {
          "id": 1,
          "slug": "aaaa",
          "name": "First Brand"
        }
      ]
    }
  ]
}
*/

  List<CategoryProductsDataData?>? data;
  CategoryProductsDataPaginate? paginate;
  CategoryProductsDataCategory? category;
  List<CategoryProductsDataSubCategory?>? subCategory;
  // List<CategoryProductsDataFilters?>? filters;

  CategoryProductsData({
    this.data,
    this.paginate,
    this.category,
    this.subCategory,
    // this.filters,
  });
  CategoryProductsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <CategoryProductsDataData>[];
      v.forEach((v) {
        arr0.add(CategoryProductsDataData.fromJson(v));
      });
      this.data = arr0;
    }
    paginate = (json['paginate'] != null)
        ? CategoryProductsDataPaginate.fromJson(json['paginate'])
        : null;
    category = (json['category'] != null)
        ? CategoryProductsDataCategory.fromJson(json['category'])
        : null;
    if (json['sub_category'] != null) {
      final v = json['sub_category'];
      final arr0 = <CategoryProductsDataSubCategory>[];
      v.forEach((v) {
        arr0.add(CategoryProductsDataSubCategory.fromJson(v));
      });
      subCategory = arr0;
    }
    // if (json['filters'] != null) {
    //   final v = json['filters'];
    //   final arr0 = <CategoryProductsDataFilters>[];
    //   v.forEach((v) {
    //     arr0.add(CategoryProductsDataFilters.fromJson(v));
    //   });
    //   filters = arr0;
    // }
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subCategory != null) {
      final v = subCategory;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['sub_category'] = arr0;
    }
    // if (filters != null) {
    //   final v = filters;
    //   final arr0 = [];
    //   v!.forEach((v) {
    //     arr0.add(v!.toJson());
    //   });
    //   data['filters'] = arr0;
    // }
    return data;
  }
}

class CategoryProducts {
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
        "images": [
          "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
        ],
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
      "lastPage": 2,
      "perPage": 15,
      "total": 17
    },
    "category": {
      "id": 1,
      "icon": "http://adphp.coffepidia.com/files/fashoin.png",
      "name": "Fashoin"
    },
    "sub_category": [
      {
        "id": 2,
        "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
        "name": "Men"
      }
    ],
    "filters": [
      {
        "name": "Brands",
        "key": "brand",
        "type": "multi",
        "options": [
          {
            "id": 1,
            "slug": "aaaa",
            "name": "First Brand"
          }
        ]
      }
    ]
  }
}
*/

  CategoryProductsData? data;

  CategoryProducts({
    this.data,
  });
  CategoryProducts.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? CategoryProductsData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}