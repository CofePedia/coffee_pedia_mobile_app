class AreasData {
/*
{
  "id": 1,
  "name": "Bahteem"
}
*/

  int? id;
  String? name;

  AreasData({
    this.id,
    this.name,
  });
  AreasData.fromJson(Map<String, dynamic> json) {
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

class Areas {
/*
{
  "data": [
    {
      "id": 1,
      "name": "Bahteem"
    }
  ]
}
*/

  List<AreasData?>? data;

  Areas({
    this.data,
  });
  Areas.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <AreasData>[];
      v.forEach((v) {
        arr0.add(AreasData.fromJson(v));
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
