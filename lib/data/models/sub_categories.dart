class SubCategoriesData {
/*
{
  "id": 2,
  "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
  "name": "Men"
}
*/

  int? id;
  String? icon;
  String? name;

  SubCategoriesData({
    this.id,
    this.icon,
    this.name,
  });
  SubCategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    icon = json['icon']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

class SubCategories {
/*
{
  "data": [
    {
      "id": 2,
      "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
      "name": "Men"
    }
  ]
}
*/

  List<SubCategoriesData?>? data;

  SubCategories({
    this.data,
  });
  SubCategories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <SubCategoriesData>[];
      v.forEach((v) {
        arr0.add(SubCategoriesData.fromJson(v));
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
