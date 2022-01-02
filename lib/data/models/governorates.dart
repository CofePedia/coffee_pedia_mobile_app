class GovernoratesData {
/*
{
  "id": 1,
  "name": "Cairo"
}
*/

  int? id;
  String? name;

  GovernoratesData({
    this.id,
    this.name,
  });
  GovernoratesData.fromJson(Map<String, dynamic> json) {
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

class Governorates {
/*
{
  "data": [
    {
      "id": 1,
      "name": "Cairo"
    }
  ]
}
*/

  List<GovernoratesData?>? data;

  Governorates({
    this.data,
  });
  Governorates.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <GovernoratesData>[];
      v.forEach((v) {
        arr0.add(GovernoratesData.fromJson(v));
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
