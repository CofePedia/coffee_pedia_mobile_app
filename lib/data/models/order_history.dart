class OrderHistoryData {
/*
{
  "id": 3,
  "status": "pending",
  "date": "05 Jan 2022"
}
*/

  int? id;
  String? status;
  String? date;

  OrderHistoryData({
    this.id,
    this.status,
    this.date,
  });
  OrderHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    status = json['status']?.toString();
    date = json['date']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['date'] = date;
    return data;
  }
}

class OrderHistory {
/*
{
  "data": [
    {
      "id": 3,
      "status": "pending",
      "date": "05 Jan 2022"
    }
  ]
}
*/

  List<OrderHistoryData?>? data;

  OrderHistory({
    this.data,
  });
  OrderHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <OrderHistoryData>[];
      v.forEach((v) {
        arr0.add(OrderHistoryData.fromJson(v));
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
