class FeaturedProductsDataPaginate {
/*
{
  "currentPage": 1,
  "lastPage": 2,
  "perPage": 15,
  "total": 28
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

class FeaturedProductsDataData {
/*
{
  "id": 1,
  "rate": 36,
  "discount": 50,
  "price_before_discount": 615,
  "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
  "description": "Autem tenetur quia quidem laboriosam maxime",
  "title": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
  "price": "415"
}
*/

  int? id;
  int? rate;
  int? discount;
  int? priceBeforeDiscount;
  String? image;
  String? description;
  String? title;
  String? price;

  FeaturedProductsDataData({
    this.id,
    this.rate,
    this.discount,
    this.priceBeforeDiscount,
    this.image,
    this.description,
    this.title,
    this.price,
  });
  FeaturedProductsDataData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    rate = json['rate']?.toInt();
    discount = json['discount']?.toInt();
    priceBeforeDiscount = json['price_before_discount']?.toInt();
    image = json['image']?.toString();
    description = json['description']?.toString();
    title = json['title']?.toString();
    price = json['price']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['rate'] = rate;
    data['discount'] = discount;
    data['price_before_discount'] = priceBeforeDiscount;
    data['image'] = image;
    data['description'] = description;
    data['title'] = title;
    data['price'] = price;
    return data;
  }
}

class FeaturedProductsData {
/*
{
  "data": [
    {
      "id": 1,
      "rate": 36,
      "discount": 50,
      "price_before_discount": 615,
      "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
      "description": "Autem tenetur quia quidem laboriosam maxime",
      "title": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
      "price": "415"
    }
  ],
  "paginate": {
    "currentPage": 1,
    "lastPage": 2,
    "perPage": 15,
    "total": 28
  }
}
*/

  List<FeaturedProductsDataData>? data;
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
      final v = this.data!;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
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
        "rate": 36,
        "discount": 50,
        "price_before_discount": 615,
        "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png",
        "description": "Autem tenetur quia quidem laboriosam maxime",
        "title": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
        "price": "415"
      }
    ],
    "paginate": {
      "currentPage": 1,
      "lastPage": 2,
      "perPage": 15,
      "total": 28
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
