class CitiesData {
/*
{
  "id": 1,
  "name": "Shoubra"
}
*/

  int? id;
  String? name;

  CitiesData({
    this.id,
    this.name,
  });
  CitiesData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Cities {
/*
{
  "data": [
    {
      "id": 1,
      "name": "Shoubra"
    }
  ]
}
*/

  List<CitiesData?>? data;

  Cities({
    this.data,
  });
  Cities.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <CitiesData>[];
      v.forEach((v) {
        arr0.add(CitiesData.fromJson(v));
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
