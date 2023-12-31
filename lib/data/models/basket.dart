class BasketDataItemsOverview {
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

  BasketDataItemsOverview({
    this.region,
    this.brand,
    this.roast,
    this.flavor,
  });
  BasketDataItemsOverview.fromJson(Map<String, dynamic> json) {
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

class BasketDataItems {
/*
{
  "id": 2,
  "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
  "name": "Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
  "rate": 3,
  "discount": null,
  "price_before_discount": 800,
  "flavor_id": 2,
  "region_id": 1,
  "roast_id": 2,
  "brand_id": 1,
  "vendor_id": "",
  "vendor": "",
  "images": [
    "http://adphp.coffepidia.com/files/makteb.jpg"
  ],
  "image": "http://adphp.coffepidia.com/files/makteb.jpg",
  "overview": {
    "region": "Regions 1",
    "brand": "First Brand",
    "roast": "Roast 2",
    "flavor": "Flavor 2"
  },
  "price": 800,
  "stock": 19,
  "quantity": 5
}
*/

  int? id;
  String? description;
  String? name;
  int? rate;
  String? discount;
  int? priceBeforeDiscount;
  int? flavorId;
  int? regionId;
  int? roastId;
  int? brandId;
  String? vendorId;
  String? vendor;
  List<String?>? images;
  String? image;
  BasketDataItemsOverview? overview;
  int? price;
  int? stock;
  int? quantity;

  BasketDataItems({
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
    this.vendor,
    this.images,
    this.image,
    this.overview,
    this.price,
    this.stock,
    this.quantity,
  });
  BasketDataItems.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    description = json['description']?.toString();
    name = json['name']?.toString();
    rate = json['rate'] == null ? 0 : json['rate'].toInt();
    discount = json['discount'] == null ? '0' : json['discount'].toString();
    priceBeforeDiscount = json['price_before_discount'] == null
        ? 0
        : json['price_before_discount'].toInt();
    flavorId = json['flavor_id']?.toInt();
    regionId = json['region_id']?.toInt();
    roastId = json['roast_id']?.toInt();
    brandId = json['brand_id']?.toInt();
    vendorId = json['vendor_id']?.toString();
    vendor = json['vendor']?.toString();
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
    image = json['image']?.toString();
    overview = (json['overview'] != null)
        ? BasketDataItemsOverview.fromJson(json['overview'])
        : null;
    price = json['price'] == null ? 0 : json['price'].toInt();
    stock = json['stock'] == null ? 0 : json['stock'].toInt();
    quantity = json['quantity'] == null ? 0 : json['quantity'].toInt();
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
    data['vendor'] = vendor;
    if (images != null) {
      final v = images;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['images'] = arr0;
    }
    data['image'] = image;
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    data['price'] = price;
    data['stock'] = stock;
    data['quantity'] = quantity;
    return data;
  }
}

class BasketData {
/*
{
  "items": [
    {
      "id": 2,
      "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
      "name": "Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
      "rate": 3,
      "discount": null,
      "price_before_discount": 800,
      "flavor_id": 2,
      "region_id": 1,
      "roast_id": 2,
      "brand_id": 1,
      "vendor_id": "",
      "vendor": "",
      "images": [
        "http://adphp.coffepidia.com/files/makteb.jpg"
      ],
      "image": "http://adphp.coffepidia.com/files/makteb.jpg",
      "overview": {
        "region": "Regions 1",
        "brand": "First Brand",
        "roast": "Roast 2",
        "flavor": "Flavor 2"
      },
      "price": 800,
      "stock": 19,
      "quantity": 5
    }
  ],
  "sub_total": 8950,
  "discount": 0,
  "delivery_charge": 0,
  "total": 8950,
  "totalItems": 10
}
*/

  List<BasketDataItems?>? items;
  int? subTotal;
  int? discount;
  int? deliveryCharge;
  int? total;
  int? totalItems;

  BasketData({
    this.items,
    this.subTotal,
    this.discount,
    this.deliveryCharge,
    this.total,
    this.totalItems,
  });
  BasketData.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      final v = json['items'];
      final arr0 = <BasketDataItems>[];
      v.forEach((v) {
        arr0.add(BasketDataItems.fromJson(v));
      });
      items = arr0;
    }
    subTotal = json['sub_total']?.toInt();
    discount = json['discount']?.toInt();
    deliveryCharge = json['delivery_charge']?.toInt();
    total = json['total']?.toInt();
    totalItems = json['totalItems']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (items != null) {
      final v = items;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['items'] = arr0;
    }
    data['sub_total'] = subTotal;
    data['discount'] = discount;
    data['delivery_charge'] = deliveryCharge;
    data['total'] = total;
    data['totalItems'] = totalItems;
    return data;
  }
}

class BasketLocal {
  int? productId, quantity, priceBeforeDiscount, stock;
  String? name, image, vendor, price;
  BasketLocal({
    this.productId,
    this.quantity,
    this.name,
    this.image,
    this.vendor,
    this.price,
    this.priceBeforeDiscount,
    this.stock,
  });
}

class Basket {
/*
{
  "data": {
    "items": [
      {
        "id": 2,
        "description": "<p>Quia sunt officiis repellendus Deserunt obcaecati sunt sit aute iusto veritatis beatae suscipit omnis corrupti consequatur dolorum autem est sint</p>",
        "name": "Consectetur minus aspernatur ad sequi deserunt id earum id nisi aut eu sunt qui eligendi molestiae",
        "rate": 3,
        "discount": null,
        "price_before_discount": 800,
        "flavor_id": 2,
        "region_id": 1,
        "roast_id": 2,
        "brand_id": 1,
        "vendor_id": "",
        "vendor": "",
        "images": [
          "http://adphp.coffepidia.com/files/makteb.jpg"
        ],
        "image": "http://adphp.coffepidia.com/files/makteb.jpg",
        "overview": {
          "region": "Regions 1",
          "brand": "First Brand",
          "roast": "Roast 2",
          "flavor": "Flavor 2"
        },
        "price": 800,
        "stock": 19,
        "quantity": 5
      }
    ],
    "sub_total": 8950,
    "discount": 0,
    "delivery_charge": 0,
    "total": 8950,
    "totalItems": 10
  }
}
*/

  BasketData? data;

  Basket({
    this.data,
  });
  Basket.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? BasketData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
