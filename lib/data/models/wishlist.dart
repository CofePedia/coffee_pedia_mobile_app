class WishlistData {
/*
{
  "id": 1,
  "title_en": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
  "description_en": "Autem tenetur quia quidem laboriosam maxime",
  "brand_id": 1,
  "product_status_id": 2,
  "vendor_id": null,
  "flavor_id": 1,
  "roast_id": 1,
  "region_id": 1,
  "item_form_id": 1,
  "added_by": 1,
  "approved_by": null,
  "views": 1,
  "total_stock": 20,
  "in_stock": 19,
  "sold": 27,
  "rate": 5,
  "ean_number": "20",
  "deleted_at": null,
  "created_at": "2021-11-03T22:00:00.000000Z",
  "updated_at": "2022-01-05T13:44:29.000000Z",
  "price_before_discount": 615,
  "discount": 50,
  "price_after_discount": 415,
  "category_id": 1,
  "sub_category_id": 2,
  "title_ar": null,
  "description_ar": null,
  "discount_category": null,
  "approved_date": null,
  "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
}
*/

  int? id;
  String? titleEn;
  String? descriptionEn;
  int? brandId;
  int? productStatusId;
  String? vendorId;
  int? flavorId;
  int? roastId;
  int? regionId;
  int? itemFormId;
  int? addedBy;
  String? approvedBy;
  int? views;
  int? totalStock;
  int? inStock;
  int? sold;
  int? rate;
  String? eanNumber;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? priceBeforeDiscount;
  int? discount;
  int? priceAfterDiscount;
  int? categoryId;
  int? subCategoryId;
  String? titleAr;
  String? descriptionAr;
  String? discountCategory;
  String? approvedDate;
  String? image;

  WishlistData({
    this.id,
    this.titleEn,
    this.descriptionEn,
    this.brandId,
    this.productStatusId,
    this.vendorId,
    this.flavorId,
    this.roastId,
    this.regionId,
    this.itemFormId,
    this.addedBy,
    this.approvedBy,
    this.views,
    this.totalStock,
    this.inStock,
    this.sold,
    this.rate,
    this.eanNumber,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.priceBeforeDiscount,
    this.discount,
    this.priceAfterDiscount,
    this.categoryId,
    this.subCategoryId,
    this.titleAr,
    this.descriptionAr,
    this.discountCategory,
    this.approvedDate,
    this.image,
  });
  WishlistData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    titleEn = json['title_en']?.toString();
    descriptionEn = json['description_en']?.toString();
    brandId = json['brand_id']?.toInt();
    productStatusId = json['product_status_id']?.toInt();
    vendorId = json['vendor_id']?.toString();
    flavorId = json['flavor_id']?.toInt();
    roastId = json['roast_id']?.toInt();
    regionId = json['region_id']?.toInt();
    itemFormId = json['item_form_id']?.toInt();
    addedBy = json['added_by']?.toInt();
    approvedBy = json['approved_by']?.toString();
    views = json['views']?.toInt();
    totalStock = json['total_stock']?.toInt();
    inStock = json['in_stock']?.toInt();
    sold = json['sold']?.toInt();
    rate = json['rate']?.toInt();
    eanNumber = json['ean_number']?.toString();
    deletedAt = json['deleted_at']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    priceBeforeDiscount = json['price_before_discount']?.toInt();
    discount = json['discount']?.toInt();
    priceAfterDiscount = json['price_after_discount']?.toInt();
    categoryId = json['category_id']?.toInt();
    subCategoryId = json['sub_category_id']?.toInt();
    titleAr = json['title_ar']?.toString();
    descriptionAr = json['description_ar']?.toString();
    discountCategory = json['discount_category']?.toString();
    approvedDate = json['approved_date']?.toString();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title_en'] = titleEn;
    data['description_en'] = descriptionEn;
    data['brand_id'] = brandId;
    data['product_status_id'] = productStatusId;
    data['vendor_id'] = vendorId;
    data['flavor_id'] = flavorId;
    data['roast_id'] = roastId;
    data['region_id'] = regionId;
    data['item_form_id'] = itemFormId;
    data['added_by'] = addedBy;
    data['approved_by'] = approvedBy;
    data['views'] = views;
    data['total_stock'] = totalStock;
    data['in_stock'] = inStock;
    data['sold'] = sold;
    data['rate'] = rate;
    data['ean_number'] = eanNumber;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['price_before_discount'] = priceBeforeDiscount;
    data['discount'] = discount;
    data['price_after_discount'] = priceAfterDiscount;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['title_ar'] = titleAr;
    data['description_ar'] = descriptionAr;
    data['discount_category'] = discountCategory;
    data['approved_date'] = approvedDate;
    data['image'] = image;
    return data;
  }
}

class Wishlist {
/*
{
  "data": [
    {
      "id": 1,
      "title_en": "Autem provident officia sunt praesentium id nostrum rerum atque id dolorum ut culpa mollit",
      "description_en": "Autem tenetur quia quidem laboriosam maxime",
      "brand_id": 1,
      "product_status_id": 2,
      "vendor_id": null,
      "flavor_id": 1,
      "roast_id": 1,
      "region_id": 1,
      "item_form_id": 1,
      "added_by": 1,
      "approved_by": null,
      "views": 1,
      "total_stock": 20,
      "in_stock": 19,
      "sold": 27,
      "rate": 5,
      "ean_number": "20",
      "deleted_at": null,
      "created_at": "2021-11-03T22:00:00.000000Z",
      "updated_at": "2022-01-05T13:44:29.000000Z",
      "price_before_discount": 615,
      "discount": 50,
      "price_after_discount": 415,
      "category_id": 1,
      "sub_category_id": 2,
      "title_ar": null,
      "description_ar": null,
      "discount_category": null,
      "approved_date": null,
      "image": "http://adphp.coffepidia.com/files/svg-png-icon-free-elevator-icon-11562964343ddllauum1a.png"
    }
  ]
}
*/

  List<WishlistData?>? data;

  Wishlist({
    this.data,
  });
  Wishlist.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <WishlistData>[];
      v.forEach((v) {
        arr0.add(WishlistData.fromJson(v));
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
