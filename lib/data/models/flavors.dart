class FlavorsData {
/*
{
  "id": 1,
  "slug": "fl",
  "name": "Flavor 1"
}
*/

  int? id;
  String? slug;
  String? name;

  FlavorsData({
    this.id,
    this.slug,
    this.name,
  });
  FlavorsData.fromJson(Map<String, dynamic> json) {
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

class Flavors {
/*
{
  "data": [
    {
      "id": 1,
      "slug": "fl",
      "name": "Flavor 1"
    }
  ]
}
*/

  List<FlavorsData?>? data;

  Flavors({
    this.data,
  });
  Flavors.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <FlavorsData>[];
      v.forEach((v) {
        arr0.add(FlavorsData.fromJson(v));
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
