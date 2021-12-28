class BrandsDataPaginate {
/*
{
  "currentPage": 1,
  "lastPage": 1,
  "perPage": 15,
  "total": 1
}
*/

  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  BrandsDataPaginate({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });
  BrandsDataPaginate.fromJson(Map<String, dynamic> json) {
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

class BrandsDataData {
/*
{
  "id": 1,
  "slug": "aaaa",
  "logo": "manager-312603_960_720(1).png",
  "name": "First Brand"
}
*/

  int? id;
  String? slug;
  String? logo;
  String? name;

  BrandsDataData({
    this.id,
    this.slug,
    this.logo,
    this.name,
  });
  BrandsDataData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    slug = json['slug']?.toString();
    logo = json['logo']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['logo'] = logo;
    data['name'] = name;
    return data;
  }
}

class BrandsData {
/*
{
  "data": [
    {
      "id": 1,
      "slug": "aaaa",
      "logo": "manager-312603_960_720(1).png",
      "name": "First Brand"
    }
  ],
  "paginate": {
    "currentPage": 1,
    "lastPage": 1,
    "perPage": 15,
    "total": 1
  }
}
*/

  List<BrandsDataData?>? data;
  BrandsDataPaginate? paginate;

  BrandsData({
    this.data,
    this.paginate,
  });
  BrandsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <BrandsDataData>[];
      v.forEach((v) {
        arr0.add(BrandsDataData.fromJson(v));
      });
      this.data = arr0;
    }
    paginate = (json['paginate'] != null)
        ? BrandsDataPaginate.fromJson(json['paginate'])
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

class Brands {
/*
{
  "data": {
    "data": [
      {
        "id": 1,
        "slug": "aaaa",
        "logo": "manager-312603_960_720(1).png",
        "name": "First Brand"
      }
    ],
    "paginate": {
      "currentPage": 1,
      "lastPage": 1,
      "perPage": 15,
      "total": 1
    }
  }
}
*/

  BrandsData? data;

  Brands({
    this.data,
  });
  Brands.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? BrandsData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
