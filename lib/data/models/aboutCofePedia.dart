class AboutCofePediaDataSetting {
/*
{
  "facebook": "https://facebook.com/",
  "twitter": "https://twitter.com/",
  "instagram": "",
  "youtube": "",
  "website": "",
  "lat": "",
  "lng": "",
  "email": "",
  "address": ""
}
*/

  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;
  String? website;
  String? lat;
  String? lng;
  String? email;
  String? address;

  AboutCofePediaDataSetting({
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube,
    this.website,
    this.lat,
    this.lng,
    this.email,
    this.address,
  });
  AboutCofePediaDataSetting.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook']?.toString();
    twitter = json['twitter']?.toString();
    instagram = json['instagram']?.toString();
    youtube = json['youtube']?.toString();
    website = json['website']?.toString();
    lat = json['lat']?.toString();
    lng = json['lng']?.toString();
    email = json['email']?.toString();
    address = json['address']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['instagram'] = instagram;
    data['youtube'] = youtube;
    data['website'] = website;
    data['lat'] = lat;
    data['lng'] = lng;
    data['email'] = email;
    data['address'] = address;
    return data;
  }
}

class AboutCofePediaDataDetailsFeature {
/*
{
  "title": "title  en",
  "description": "description en ",
  "image": ""
}
*/

  String? title;
  String? description;
  String? image;

  AboutCofePediaDataDetailsFeature({
    this.title,
    this.description,
    this.image,
  });
  AboutCofePediaDataDetailsFeature.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}

class AboutCofePediaDataDetails {
/*
{
  "title": "title en",
  "description": "A game requiring the selection of three arbitrary individuals to be categorized in a one-to-one fashion with three categories: one individual must be copulated with and then discarded (the Do); one individual must be entered into a long-term commitment with (the Date); the final individual is one that you would forego any interaction with (the Dump).",
  "image": "",
  "feature": [
    {
      "title": "title  en",
      "description": "description en ",
      "image": ""
    }
  ]
}
*/

  String? title;
  String? description;
  String? image;
  List<AboutCofePediaDataDetailsFeature?>? feature;

  AboutCofePediaDataDetails({
    this.title,
    this.description,
    this.image,
    this.feature,
  });
  AboutCofePediaDataDetails.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    if (json['feature'] != null) {
      final v = json['feature'];
      final arr0 = <AboutCofePediaDataDetailsFeature>[];
      v.forEach((v) {
        arr0.add(AboutCofePediaDataDetailsFeature.fromJson(v));
      });
      feature = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
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

class AboutCofePediaData {
/*
{
  "details": {
    "title": "title en",
    "description": "A game requiring the selection of three arbitrary individuals to be categorized in a one-to-one fashion with three categories: one individual must be copulated with and then discarded (the Do); one individual must be entered into a long-term commitment with (the Date); the final individual is one that you would forego any interaction with (the Dump).",
    "image": "",
    "feature": [
      {
        "title": "title  en",
        "description": "description en ",
        "image": ""
      }
    ]
  },
  "brands": [
    "https://cofepedia.com/uploads/logo/h0EFHHWv6RnqBq6PfuTHufUl05VYNJuu9hg49DXX.jpg"
  ],
  "setting": {
    "facebook": "https://facebook.com/",
    "twitter": "https://twitter.com/",
    "instagram": "",
    "youtube": "",
    "website": "",
    "lat": "",
    "lng": "",
    "email": "",
    "address": ""
  }
}
*/

  AboutCofePediaDataDetails? details;
  List<String?>? brands;
  AboutCofePediaDataSetting? setting;

  AboutCofePediaData({
    this.details,
    this.brands,
    this.setting,
  });
  AboutCofePediaData.fromJson(Map<String, dynamic> json) {
    details = (json['details'] != null)
        ? AboutCofePediaDataDetails.fromJson(json['details'])
        : null;
    if (json['brands'] != null) {
      final v = json['brands'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      brands = arr0;
    }
    setting = (json['setting'] != null)
        ? AboutCofePediaDataSetting.fromJson(json['setting'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (details != null) {
      data['details'] = details!.toJson();
    }
    if (brands != null) {
      final v = brands;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['brands'] = arr0;
    }
    if (setting != null) {
      data['setting'] = setting!.toJson();
    }
    return data;
  }
}

class AboutCofePedia {
/*
{
  "data": {
    "details": {
      "title": "title en",
      "description": "A game requiring the selection of three arbitrary individuals to be categorized in a one-to-one fashion with three categories: one individual must be copulated with and then discarded (the Do); one individual must be entered into a long-term commitment with (the Date); the final individual is one that you would forego any interaction with (the Dump).",
      "image": "",
      "feature": [
        {
          "title": "title  en",
          "description": "description en ",
          "image": ""
        }
      ]
    },
    "brands": [
      "https://cofepedia.com/uploads/logo/h0EFHHWv6RnqBq6PfuTHufUl05VYNJuu9hg49DXX.jpg"
    ],
    "setting": {
      "facebook": "https://facebook.com/",
      "twitter": "https://twitter.com/",
      "instagram": "",
      "youtube": "",
      "website": "",
      "lat": "",
      "lng": "",
      "email": "",
      "address": ""
    }
  }
}
*/

  AboutCofePediaData? data;

  AboutCofePedia({
    this.data,
  });
  AboutCofePedia.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? AboutCofePediaData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
