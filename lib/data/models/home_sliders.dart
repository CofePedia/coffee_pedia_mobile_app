class HomeSlidersData {
/*
{
  "id": 1,
  "title": "",
  "brif": null,
  "description": null,
  "image": "https://cofepedia.com/uploads//sliders/ad-1-web-big-banner.png",
  "url": null
}
*/

  int? id;
  String? title;
  String? brif;
  String? description;
  String? image;
  String? url;

  HomeSlidersData({
    this.id,
    this.title,
    this.brif,
    this.description,
    this.image,
    this.url,
  });
  HomeSlidersData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    brif = json['brif']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['brif'] = brif;
    data['description'] = description;
    data['image'] = image;
    data['url'] = url;
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
      "brif": null,
      "description": null,
      "image": "https://cofepedia.com/uploads//sliders/ad-1-web-big-banner.png",
      "url": null
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
