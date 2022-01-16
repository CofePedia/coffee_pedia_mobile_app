///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
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

class OrderHistoryDataItems {
/*
{
  "id": 3,
  "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
  "name": "22 Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
  "rate": 2,
  "discount": 0,
  "price_before_discount": 990,
  "flavor_id": 2,
  "region_id": 1,
  "roast_id": 2,
  "brand_id": 1,
  "vendor_id": 0,
  "images": [
    "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
  ],
  "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
  "vendor": "",
  "overview": {
    "region": "Regions 1",
    "brand": "First Brand",
    "roast": "Roast 2",
    "flavor": "Flavor 2"
  },
  "stock": 19,
  "price": 487,
  "quantity": 2,
  "cost": 1980
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
  String? image;
  String? vendor;
  OrderHistoryDataItemsOverview? overview;
  int? stock;
  int? price;
  int? quantity;
  int? cost;

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
    this.image,
    this.vendor,
    this.overview,
    this.stock,
    this.price,
    this.quantity,
    this.cost,
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
    image = json['image']?.toString();
    vendor = json['vendor']?.toString();
    overview = (json['overview'] != null)
        ? OrderHistoryDataItemsOverview.fromJson(json['overview'])
        : null;
    stock = json['stock']?.toInt();
    price = json['price']?.toInt();
    quantity = json['quantity']?.toInt();
    cost = json['cost']?.toInt();
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
    data['image'] = image;
    data['vendor'] = vendor;
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    data['stock'] = stock;
    data['price'] = price;
    data['quantity'] = quantity;
    data['cost'] = cost;
    return data;
  }
}

class OrderHistoryData {
/*
{
  "id": 3,
  "status": "pending",
  "status_color": "0xff107CC0",
  "date": "05 Jan 2022",
  "items": [
    {
      "id": 3,
      "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
      "name": "22 Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
      "rate": 2,
      "discount": 0,
      "price_before_discount": 990,
      "flavor_id": 2,
      "region_id": 1,
      "roast_id": 2,
      "brand_id": 1,
      "vendor_id": 0,
      "images": [
        "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
      ],
      "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
      "vendor": "",
      "overview": {
        "region": "Regions 1",
        "brand": "First Brand",
        "roast": "Roast 2",
        "flavor": "Flavor 2"
      },
      "stock": 19,
      "price": 487,
      "quantity": 2,
      "cost": 1980
    }
  ]
}
*/

  int? id;
  String? status;
  String? statusColor;
  String? date;
  List<OrderHistoryDataItems?>? items;

  OrderHistoryData({
    this.id,
    this.status,
    this.statusColor,
    this.date,
    this.items,
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
    return data;
  }
}

class OrderHistory {
/*
{
  "data": [
    {
      "id": 3,
      "status": "pending",
      "status_color": "0xff107CC0",
      "date": "05 Jan 2022",
      "items": [
        {
          "id": 3,
          "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
          "name": "22 Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
          "rate": 2,
          "discount": 0,
          "price_before_discount": 990,
          "flavor_id": 2,
          "region_id": 1,
          "roast_id": 2,
          "brand_id": 1,
          "vendor_id": 0,
          "images": [
            "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
          ],
          "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
          "vendor": "",
          "overview": {
            "region": "Regions 1",
            "brand": "First Brand",
            "roast": "Roast 2",
            "flavor": "Flavor 2"
          },
          "stock": 19,
          "price": 487,
          "quantity": 2,
          "cost": 1980
        }
      ]
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