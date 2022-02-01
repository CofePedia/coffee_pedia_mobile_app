class MyAddressesData {
/*
{
  "id": 75,
  "street": "lknm.",
  "details": "",
  "primary": 0,
  "city": "Shoubra",
  "city_id": 1,
  "area": "Bahteem",
  "area_id": 1,
  "governorate": "Cairo",
  "governorate_id": 1,
  "name": "lkn.;"
}
*/

  int? id;
  String? street;
  String? details;
  int? primary;
  String? city;
  int? cityId;
  String? area;
  int? areaId;
  String? governorate;
  int? governorateId;
  String? name;

  MyAddressesData({
    this.id,
    this.street,
    this.details,
    this.primary,
    this.city,
    this.cityId,
    this.area,
    this.areaId,
    this.governorate,
    this.governorateId,
    this.name,
  });
  MyAddressesData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    street = json['street']?.toString();
    details = json['details']?.toString();
    primary = json['primary']?.toInt();
    city = json['city']?.toString();
    cityId = json['city_id']?.toInt();
    area = json['area']?.toString();
    areaId = json['area_id']?.toInt();
    governorate = json['governorate']?.toString();
    governorateId = json['governorate_id']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['street'] = street;
    data['details'] = details;
    data['primary'] = primary;
    data['city'] = city;
    data['city_id'] = cityId;
    data['area'] = area;
    data['area_id'] = areaId;
    data['governorate'] = governorate;
    data['governorate_id'] = governorateId;
    data['name'] = name;
    return data;
  }
}

class MyAddresses {
/*
{
  "data": [
    {
      "id": 75,
      "street": "lknm.",
      "details": "",
      "primary": 0,
      "city": "Shoubra",
      "city_id": 1,
      "area": "Bahteem",
      "area_id": 1,
      "governorate": "Cairo",
      "governorate_id": 1,
      "name": "lkn.;"
    }
  ]
}
*/

  List<MyAddressesData?>? data;

  MyAddresses({
    this.data,
  });
  MyAddresses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <MyAddressesData>[];
      v.forEach((v) {
        arr0.add(MyAddressesData.fromJson(v));
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
