class RoastsData {
/*
{
  "id": 1,
  "slug": "Roasts",
  "name": "Roasts 1"
}
*/

  int? id;
  String? slug;
  String? name;

  RoastsData({
    this.id,
    this.slug,
    this.name,
  });
  RoastsData.fromJson(Map<String, dynamic> json) {
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

class Roasts {
/*
{
  "data": [
    {
      "id": 1,
      "slug": "Roasts",
      "name": "Roasts 1"
    }
  ]
}
*/

  List<RoastsData?>? data;

  Roasts({
    this.data,
  });
  Roasts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <RoastsData>[];
      v.forEach((v) {
        arr0.add(RoastsData.fromJson(v));
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
