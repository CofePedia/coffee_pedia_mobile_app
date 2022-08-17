class StaticPageDataFeature {
/*
{
  "id": 2,
  "image": "",
  "static_pages_id": 1,
  "description": "Purpose of this privacy notice\r\n\r\nThis privacy notice aims to give you information on how CofePedia EG Store collects and processes your personal data through your use of this website, including any data you may provide through this website when you sign up to our newsletter, purchase a product or service.\r\n\r\nThis website is not intended for children and we do not knowingly collect data relating to children.\r\n\r\nIt is important that you read this privacy notice together with any other privacy notice or fair processing notice we may provide on specific occasions when we are collecting or processing personal data about you so that you are fully aware of how and why we are using your data. This privacy notice supplements the other notices and is not intended to override them.",
  "title": "1. Important information and who we are\r\n"
}
*/

  int? id;
  String? image;
  int? staticPagesId;
  String? description;
  String? title;

  StaticPageDataFeature({
    this.id,
    this.image,
    this.staticPagesId,
    this.description,
    this.title,
  });
  StaticPageDataFeature.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    image = json['image']?.toString();
    staticPagesId = json['static_pages_id']?.toInt();
    description = json['description']?.toString();
    title = json['title']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['static_pages_id'] = staticPagesId;
    data['description'] = description;
    data['title'] = title;
    return data;
  }
}

class StaticPageData {
/*
{
  "id": 1,
  "slug": "privacy-policy",
  "image": "",
  "description": "Welcome to the CofePedia EG Store privacy notice.\r\n\r\nCofePedia EG Store are committed to protecting and respecting your privacy.\r\n\r\nThis policy sets out the basis on which any personal data we collect from you, or that you provide to us, will be processed by us. This privacy notice will inform you as to how we look after your personal data when you visit our website (regardless of where you visit it from) and tell you about your privacy rights and how the law protects you. By visiting cofepedia.com you are accepting and consenting to the practices described in this policy.",
  "title": "Privacy  Policy",
  "feature": [
    {
      "id": 2,
      "image": "",
      "static_pages_id": 1,
      "description": "Purpose of this privacy notice\r\n\r\nThis privacy notice aims to give you information on how CofePedia EG Store collects and processes your personal data through your use of this website, including any data you may provide through this website when you sign up to our newsletter, purchase a product or service.\r\n\r\nThis website is not intended for children and we do not knowingly collect data relating to children.\r\n\r\nIt is important that you read this privacy notice together with any other privacy notice or fair processing notice we may provide on specific occasions when we are collecting or processing personal data about you so that you are fully aware of how and why we are using your data. This privacy notice supplements the other notices and is not intended to override them.",
      "title": "1. Important information and who we are\r\n"
    }
  ]
}
*/

  int? id;
  String? slug;
  String? image;
  String? description;
  String? title;
  List<StaticPageDataFeature?>? feature;

  StaticPageData({
    this.id,
    this.slug,
    this.image,
    this.description,
    this.title,
    this.feature,
  });
  StaticPageData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    slug = json['slug']?.toString();
    image = json['image']?.toString();
    description = json['description']?.toString();
    title = json['title']?.toString();
    if (json['feature'] != null) {
      final v = json['feature'];
      final arr0 = <StaticPageDataFeature>[];
      v.forEach((v) {
        arr0.add(StaticPageDataFeature.fromJson(v));
      });
      feature = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['image'] = image;
    data['description'] = description;
    data['title'] = title;
    if (feature != null) {
      final v = feature;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['feature'] = arr0;
    }
    return data;
  }
}

class StaticPage {
/*
{
  "data": {
    "id": 1,
    "slug": "privacy-policy",
    "image": "",
    "description": "Welcome to the CofePedia EG Store privacy notice.\r\n\r\nCofePedia EG Store are committed to protecting and respecting your privacy.\r\n\r\nThis policy sets out the basis on which any personal data we collect from you, or that you provide to us, will be processed by us. This privacy notice will inform you as to how we look after your personal data when you visit our website (regardless of where you visit it from) and tell you about your privacy rights and how the law protects you. By visiting cofepedia.com you are accepting and consenting to the practices described in this policy.",
    "title": "Privacy  Policy",
    "feature": [
      {
        "id": 2,
        "image": "",
        "static_pages_id": 1,
        "description": "Purpose of this privacy notice\r\n\r\nThis privacy notice aims to give you information on how CofePedia EG Store collects and processes your personal data through your use of this website, including any data you may provide through this website when you sign up to our newsletter, purchase a product or service.\r\n\r\nThis website is not intended for children and we do not knowingly collect data relating to children.\r\n\r\nIt is important that you read this privacy notice together with any other privacy notice or fair processing notice we may provide on specific occasions when we are collecting or processing personal data about you so that you are fully aware of how and why we are using your data. This privacy notice supplements the other notices and is not intended to override them.",
        "title": "1. Important information and who we are\r\n"
      }
    ]
  }
}
*/

  StaticPageData? data;

  StaticPage({
    this.data,
  });
  StaticPage.fromJson(Map<String, dynamic> json) {
    data =
        (json['data'] != null) ? StaticPageData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
