class RegionsData {
/*
{
  "id": 1,
  "slug": "Regions",
  "name": "Regions 1"
}
*/

  int? id;
  String? slug;
  String? name;

  RegionsData({
    this.id,
    this.slug,
    this.name,
  });
  RegionsData.fromJson(Map<String, dynamic> json) {
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

class Regions {
/*
{
  "data": [
    {
      "id": 1,
      "slug": "Regions",
      "name": "Regions 1"
    }
  ]
}
*/

  List<RegionsData?>? data;

  Regions({
    this.data,
  });
  Regions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <RegionsData>[];
      v.forEach((v) {
        arr0.add(RegionsData.fromJson(v));
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
