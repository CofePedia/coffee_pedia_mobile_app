class VendorDetailsData {
/*
{
  "id": 61,
  "logo": "https://api-staging.coffepidia.com/saved_images/logo/8XxG4OE8eDPhdD5cHyOFkJkr9M9b8VND8AZ9h3bn.jpg",
  "feature": [
    "Takeaway"
  ],
  "company_name": "my comamy",
  "cover_photo": "https://api-staging.coffepidia.com/saved_images/cover_photo/tVHLNO9XqmHo4CYFufWD7iZegswXTdjf0zNh4waZ.jpg",
  "description": null,
  "address": "Address English",
  "map": null
}
*/

  int? id;
  String? logo;
  List<String?>? feature;
  String? companyName;
  String? coverPhoto;
  String? description;
  String? address;
  String? map;

  VendorDetailsData({
    this.id,
    this.logo,
    this.feature,
    this.companyName,
    this.coverPhoto,
    this.description,
    this.address,
    this.map,
  });
  VendorDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    logo = json['logo']?.toString();
    if (json['feature'] != null) {
      final v = json['feature'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      feature = arr0;
    }
    companyName = json['company_name']?.toString();
    coverPhoto = json['cover_photo']?.toString();
    description = json['description']?.toString();
    address = json['address']?.toString();
    map = json['map']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['logo'] = logo;
    if (feature != null) {
      final v = feature;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['feature'] = arr0;
    }
    data['company_name'] = companyName;
    data['cover_photo'] = coverPhoto;
    data['description'] = description;
    data['address'] = address;
    data['map'] = map;
    return data;
  }
}

class VendorDetails {
/*
{
  "data": {
    "id": 61,
    "logo": "https://api-staging.coffepidia.com/saved_images/logo/8XxG4OE8eDPhdD5cHyOFkJkr9M9b8VND8AZ9h3bn.jpg",
    "feature": [
      "Takeaway"
    ],
    "company_name": "my comamy",
    "cover_photo": "https://api-staging.coffepidia.com/saved_images/cover_photo/tVHLNO9XqmHo4CYFufWD7iZegswXTdjf0zNh4waZ.jpg",
    "description": null,
    "address": "Address English",
    "map": null
  }
}
*/

  VendorDetailsData? data;

  VendorDetails({
    this.data,
  });
  VendorDetails.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? VendorDetailsData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
