// class HomeSlidersDataSubCategories {
// /*
// {
//   "id": 11,
//   "order": 1,
//   "slug": "Coffee Machines",
//   "icon": "https://cofepedia.com/uploads//categories/coffee-machines@3x.png",
//   "order_row": 0,
//   "name": "Coffee Machines"
// }
// */
//
//   int? id;
//   int? order;
//   String? slug;
//   String? icon;
//   int? orderRow;
//   String? name;
//
//   HomeSlidersDataSubCategories({
//     this.id,
//     this.order,
//     this.slug,
//     this.icon,
//     this.orderRow,
//     this.name,
//   });
//   HomeSlidersDataSubCategories.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     order = json['order']?.toInt();
//     slug = json['slug']?.toString();
//     icon = json['icon']?.toString();
//     orderRow = json['order_row']?.toInt();
//     name = json['name']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['order'] = order;
//     data['slug'] = slug;
//     data['icon'] = icon;
//     data['order_row'] = orderRow;
//     data['name'] = name;
//     return data;
//   }
// }

import 'categories.dart';

class HomeSlidersData {
/*
{
  "id": 1,
  "title": "",
  "brif": "",
  "description": "",
  "image": "https://cofepedia.com/uploads//sliders/ad-4-web-big-banner@2x.png",
  "url": "",
  "product_id": "",
  "category_id": 10,
  "sub_category_id": 11,
  "sub_categories": [
    {
      "id": 11,
      "order": 1,
      "slug": "Coffee Machines",
      "icon": "https://cofepedia.com/uploads//categories/coffee-machines@3x.png",
      "order_row": 0,
      "name": "Coffee Machines"
    }
  ]
}
*/

  int? id;
  String? title;
  String? brif;
  String? description;
  String? image;
  String? url;
  int? productId;
  int? categoryId;
  int? subCategoryId;
  String? subCategoryName;
  List<CategoriesDataChildren?>? subCategories;

  HomeSlidersData({
    this.id,
    this.title,
    this.brif,
    this.description,
    this.image,
    this.url,
    this.productId,
    this.categoryId,
    this.subCategoryId,
    this.subCategoryName,
    this.subCategories,
  });
  HomeSlidersData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    brif = json['brif']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    url = json['url']?.toString();
    productId = json['product_id']?.toInt();
    categoryId = json['category_id']?.toInt();
    subCategoryId = json['sub_category_id']?.toInt();
    subCategoryName = json['sub_category_name']?.toString();
    if (json['sub_categories'] != null) {
      final v = json['sub_categories'];
      final arr0 = <CategoriesDataChildren>[];
      v.forEach((v) {
        arr0.add(CategoriesDataChildren.fromJson(v));
      });
      subCategories = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['brif'] = brif;
    data['description'] = description;
    data['image'] = image;
    data['url'] = url;
    data['product_id'] = productId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['sub_category_name'] = subCategoryName;

    if (subCategories != null) {
      final v = subCategories;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['sub_categories'] = arr0;
    }
    return data;
  }
}

class HomeSliders {
/*
{
  "data": [
    {
      "id": 1,
      "title": "",
      "brif": "",
      "description": "",
      "image": "https://cofepedia.com/uploads//sliders/ad-4-web-big-banner@2x.png",
      "url": "",
      "product_id": "",
      "category_id": 10,
      "sub_category_id": 11,
      "sub_categories": [
        {
          "id": 11,
          "order": 1,
          "slug": "Coffee Machines",
          "icon": "https://cofepedia.com/uploads//categories/coffee-machines@3x.png",
          "order_row": 0,
          "name": "Coffee Machines"
        }
      ]
    }
  ]
}
*/

  List<HomeSlidersData?>? data;

  HomeSliders({
    this.data,
  });
  HomeSliders.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <HomeSlidersData>[];
      v.forEach((v) {
        arr0.add(HomeSlidersData.fromJson(v));
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
