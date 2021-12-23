class HomeAdsDataInPage {
/*
{
  "id": 7,
  "name": "First",
  "image": "http://adphp.coffepidia.com/files/home-page-make-it-in-your-home-b4af8b1.png",
  "url": "https://www.google.com/"
}
*/

  int? id;
  String? name;
  String? image;
  String? url;

  HomeAdsDataInPage({
    this.id,
    this.name,
    this.image,
    this.url,
  });
  HomeAdsDataInPage.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}

class HomeAdsDataBesideSlider {
/*
{
  "id": 5,
  "name": "First",
  "image": "http://adphp.coffepidia.com/files/new-drink-7793138.jpg",
  "url": "https://www.google.com/"
}
*/

  int? id;
  String? name;
  String? image;
  String? url;

  HomeAdsDataBesideSlider({
    this.id,
    this.name,
    this.image,
    this.url,
  });
  HomeAdsDataBesideSlider.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}

class HomeAdsDataTopHeader {
/*
{
  "id": 1,
  "name": "First",
  "image": "http://adphp.coffepidia.com/files/daily-deals-6233c8c.jpg",
  "url": "https://www.google.com/"
}
*/

  int? id;
  String? name;
  String? image;
  String? url;

  HomeAdsDataTopHeader({
    this.id,
    this.name,
    this.image,
    this.url,
  });
  HomeAdsDataTopHeader.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}

class HomeAdsData {
/*
{
  "top_header": [
    {
      "id": 1,
      "name": "First",
      "image": "http://adphp.coffepidia.com/files/daily-deals-6233c8c.jpg",
      "url": "https://www.google.com/"
    }
  ],
  "beside_slider": [
    {
      "id": 5,
      "name": "First",
      "image": "http://adphp.coffepidia.com/files/new-drink-7793138.jpg",
      "url": "https://www.google.com/"
    }
  ],
  "in_page": [
    {
      "id": 7,
      "name": "First",
      "image": "http://adphp.coffepidia.com/files/home-page-make-it-in-your-home-b4af8b1.png",
      "url": "https://www.google.com/"
    }
  ]
}
*/

  List<HomeAdsDataTopHeader>? topHeader;
  List<HomeAdsDataBesideSlider>? besideSlider;
  List<HomeAdsDataInPage>? inPage;

  HomeAdsData({
    this.topHeader,
    this.besideSlider,
    this.inPage,
  });
  HomeAdsData.fromJson(Map<String, dynamic> json) {
    if (json['top_header'] != null) {
      final v = json['top_header'];
      final arr0 = <HomeAdsDataTopHeader>[];
      v.forEach((v) {
        arr0.add(HomeAdsDataTopHeader.fromJson(v));
      });
      topHeader = arr0;
    }
    if (json['beside_slider'] != null) {
      final v = json['beside_slider'];
      final arr0 = <HomeAdsDataBesideSlider>[];
      v.forEach((v) {
        arr0.add(HomeAdsDataBesideSlider.fromJson(v));
      });
      besideSlider = arr0;
    }
    if (json['in_page'] != null) {
      final v = json['in_page'];
      final arr0 = <HomeAdsDataInPage>[];
      v.forEach((v) {
        arr0.add(HomeAdsDataInPage.fromJson(v));
      });
      inPage = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (topHeader != null) {
      final v = topHeader;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v.toJson());
      });
      data['top_header'] = arr0;
    }
    if (besideSlider != null) {
      final v = besideSlider;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v.toJson());
      });
      data['beside_slider'] = arr0;
    }
    if (inPage != null) {
      final v = inPage;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v.toJson());
      });
      data['in_page'] = arr0;
    }
    return data;
  }
}

class HomeAds {
/*
{
  "data": {
    "top_header": [
      {
        "id": 1,
        "name": "First",
        "image": "http://adphp.coffepidia.com/files/daily-deals-6233c8c.jpg",
        "url": "https://www.google.com/"
      }
    ],
    "beside_slider": [
      {
        "id": 5,
        "name": "First",
        "image": "http://adphp.coffepidia.com/files/new-drink-7793138.jpg",
        "url": "https://www.google.com/"
      }
    ],
    "in_page": [
      {
        "id": 7,
        "name": "First",
        "image": "http://adphp.coffepidia.com/files/home-page-make-it-in-your-home-b4af8b1.png",
        "url": "https://www.google.com/"
      }
    ]
  }
}
*/

  HomeAdsData? data;

  HomeAds({
    this.data,
  });
  HomeAds.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? HomeAdsData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
