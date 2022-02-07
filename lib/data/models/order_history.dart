class OrderHistoryDataItemsOverview {
/*
{
  "region": "Regions 1",
  "brand": "First Brand",
  "roast": "Roast 2",
  "flavor": "Flavor 2"
}
*/

  String? region;
  String? brand;
  String? roast;
  String? flavor;

  OrderHistoryDataItemsOverview({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  OrderHistoryDataItemsOverview.fromJson(Map<String, dynamic> json) {
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

class OrderHistoryDataItemsVendor {
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

  OrderHistoryDataItemsVendor({
    this.id,
    this.logo,
    this.feature,
    this.companyName,
    this.coverPhoto,
    this.description,
    this.address,
    this.map,
  });
  OrderHistoryDataItemsVendor.fromJson(Map<String, dynamic> json) {
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

class OrderHistoryDataItems {
/*
{
  "id": 2,
  "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
  "name": "Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
  "rate": 3,
  "discount": 0,
  "price_before_discount": 800,
  "flavor_id": 0,
  "region_id": 0,
  "roast_id": 0,
  "brand_id": 0,
  "vendor_id": 0,
  "images": [
    "https://api-staging.coffepidia.com/saved_images/products/makteb.jpg"
  ],
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
    "roast": "Roast 2",
    "flavor": "Flavor 2"
  },
  "stock": 73,
  "price": 487,
  "quantity": 5,
  "cost": 4000,
  "in_wishlist": null
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
  OrderHistoryDataItemsVendor? vendor;
  OrderHistoryDataItemsOverview? overview;
  int? stock;
  int? price;
  int? quantity;
  int? cost;
  String? inWishlist;

  OrderHistoryDataItems({
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
    this.stock,
    this.price,
    this.quantity,
    this.cost,
    this.inWishlist,
  });
  OrderHistoryDataItems.fromJson(Map<String, dynamic> json) {
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
    vendor = (json['vendor'] != null)
        ? OrderHistoryDataItemsVendor.fromJson(json['vendor'])
        : null;
    overview = (json['overview'] != null)
        ? OrderHistoryDataItemsOverview.fromJson(json['overview'])
        : null;
    stock = json['stock']?.toInt();
    price = json['price']?.toInt();
    quantity = json['quantity']?.toInt();
    cost = json['cost']?.toInt();
    inWishlist = json['in_wishlist']?.toString();
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
    data['stock'] = stock;
    data['price'] = price;
    data['quantity'] = quantity;
    data['cost'] = cost;
    data['in_wishlist'] = inWishlist;
    return data;
  }
}

class OrderHistoryData {
/*
{
  "id": 34,
  "status": "Accept",
  "status_color": "14B93B",
  "date": "18 Jan 2022",
  "items": [
    {
      "id": 2,
      "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
      "name": "Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
      "rate": 3,
      "discount": 0,
      "price_before_discount": 800,
      "flavor_id": 0,
      "region_id": 0,
      "roast_id": 0,
      "brand_id": 0,
      "vendor_id": 0,
      "images": [
        "https://api-staging.coffepidia.com/saved_images/products/makteb.jpg"
      ],
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
        "roast": "Roast 2",
        "flavor": "Flavor 2"
      },
      "stock": 73,
      "price": 487,
      "quantity": 5,
      "cost": 4000,
      "in_wishlist": null
    }
  ],
  "total_items": 10,
  "sub_total": 8950,
  "delivery_charge": 0,
  "discount": 0,
  "total_price": 8950,
  "payment_method": "Wallet",
  "address": ""
}
*/

  int? id;
  String? status;
  String? statusColor;
  String? date;
  List<OrderHistoryDataItems?>? items;
  int? totalItems;
  int? subTotal;
  int? deliveryCharge;
  int? discount;
  int? totalPrice;
  String? paymentMethod;
  String? address;

  OrderHistoryData({
    this.id,
    this.status,
    this.statusColor,
    this.date,
    this.items,
    this.totalItems,
    this.subTotal,
    this.deliveryCharge,
    this.discount,
    this.totalPrice,
    this.paymentMethod,
    this.address,
  });
  OrderHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    status = json['status']?.toString();
    statusColor = json['status_color']?.toString();
    date = json['date']?.toString();
    if (json['items'] != null) {
      final v = json['items'];
      final arr0 = <OrderHistoryDataItems>[];
      v.forEach((v) {
        arr0.add(OrderHistoryDataItems.fromJson(v));
      });
      items = arr0;
    }
    totalItems = json['total_items']?.toInt();
    subTotal = json['sub_total']?.toInt();
    deliveryCharge = json['delivery_charge']?.toInt();
    discount = json['discount']?.toInt();
    totalPrice = json['total_price']?.toInt();
    paymentMethod = json['payment_method']?.toString();
    address = json['address']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['status_color'] = statusColor;
    data['date'] = date;
    if (items != null) {
      final v = items;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['items'] = arr0;
    }
    data['total_items'] = totalItems;
    data['sub_total'] = subTotal;
    data['delivery_charge'] = deliveryCharge;
    data['discount'] = discount;
    data['total_price'] = totalPrice;
    data['payment_method'] = paymentMethod;
    data['address'] = address;
    return data;
  }
}

class OrderHistory {
/*
{
  "data": [
    {
      "id": 34,
      "status": "Accept",
      "status_color": "14B93B",
      "date": "18 Jan 2022",
      "items": [
        {
          "id": 2,
          "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
          "name": "Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
          "rate": 3,
          "discount": 0,
          "price_before_discount": 800,
          "flavor_id": 0,
          "region_id": 0,
          "roast_id": 0,
          "brand_id": 0,
          "vendor_id": 0,
          "images": [
            "https://api-staging.coffepidia.com/saved_images/products/makteb.jpg"
          ],
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
            "roast": "Roast 2",
            "flavor": "Flavor 2"
          },
          "stock": 73,
          "price": 487,
          "quantity": 5,
          "cost": 4000,
          "in_wishlist": null
        }
      ],
      "total_items": 10,
      "sub_total": 8950,
      "delivery_charge": 0,
      "discount": 0,
      "total_price": 8950,
      "payment_method": "Wallet",
      "address": ""
    }
  ]
}
*/

  List<OrderHistoryData?>? data;

  OrderHistory({
    this.data,
  });
  OrderHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <OrderHistoryData>[];
      v.forEach((v) {
        arr0.add(OrderHistoryData.fromJson(v));
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
