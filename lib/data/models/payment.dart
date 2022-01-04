class PaymentsData {
/*
{
  "id": 1,
  "logo": null,
  "collapse": 0,
  "name": "Wallet"
}
*/

  int? id;
  String? logo;
  int? collapse;
  String? name;

  PaymentsData({
    this.id,
    this.logo,
    this.collapse,
    this.name,
  });
  PaymentsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    logo = json['logo']?.toString();
    collapse = json['collapse']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['logo'] = logo;
    data['collapse'] = collapse;
    data['name'] = name;
    return data;
  }
}

class Payments {
/*
{
  "data": [
    {
      "id": 1,
      "logo": null,
      "collapse": 0,
      "name": "Wallet"
    }
  ]
}
*/

  List<PaymentsData?>? data;

  Payments({
    this.data,
  });
  Payments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <PaymentsData>[];
      v.forEach((v) {
        arr0.add(PaymentsData.fromJson(v));
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
