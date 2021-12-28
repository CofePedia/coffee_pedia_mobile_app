class CategoriesDataChildren {
/*
{
  "id": 2,
  "order": 1,
  "slug": "men",
  "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
  "name": "Men"
}
*/

  int? id;
  int? order;
  String? slug;
  String? icon;
  String? name;

  CategoriesDataChildren({
    this.id,
    this.order,
    this.slug,
    this.icon,
    this.name,
  });
  CategoriesDataChildren.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    order = json['order']?.toInt();
    slug = json['slug']?.toString();
    icon = json['icon']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['order'] = order;
    data['slug'] = slug;
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

class CategoriesData {
/*
{
  "id": 1,
  "icon": "http://adphp.coffepidia.com/files/road2.jpg",
  "name": "Fashoin",
  "children": [
    {
      "id": 2,
      "order": 1,
      "slug": "men",
      "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
      "name": "Men"
    }
  ]
}
*/

  int? id;
  String? icon;
  String? name;
  List<CategoriesDataChildren?>? children;

  CategoriesData({
    this.id,
    this.icon,
    this.name,
    this.children,
  });
  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    icon = json['icon']?.toString();
    name = json['name']?.toString();
    if (json['children'] != null) {
      final v = json['children'];
      final arr0 = <CategoriesDataChildren>[];
      v.forEach((v) {
        arr0.add(CategoriesDataChildren.fromJson(v));
      });
      children = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    if (children != null) {
      final v = children;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['children'] = arr0;
    }
    return data;
  }
}

class Categories {
/*
{
  "data": [
    {
      "id": 1,
      "icon": "http://adphp.coffepidia.com/files/road2.jpg",
      "name": "Fashoin",
      "children": [
        {
          "id": 2,
          "order": 1,
          "slug": "men",
          "icon": "http://adphp.coffepidia.com/files/manager-312603_960_720.png",
          "name": "Men"
        }
      ]
    }
  ]
}
*/

  List<CategoriesData?>? data;

  Categories({
    this.data,
  });
  Categories.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <CategoriesData>[];
      v.forEach((v) {
        arr0.add(CategoriesData.fromJson(v));
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
