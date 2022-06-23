class ReorderDataMsg {
/*
{
  "message": "Order Has Been Added To Your Cart"
}
*/

  String? message;

  ReorderDataMsg({
    this.message,
  });
  ReorderDataMsg.fromJson(Map<String, dynamic> json) {
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}

class ReorderData {
/*
{
  "msg": {
    "message": "Order Has Been Added To Your Cart"
  }
}
*/

  ReorderDataMsg? msg;

  ReorderData({
    this.msg,
  });
  ReorderData.fromJson(Map<String, dynamic> json) {
    msg = (json['msg'] != null) ? ReorderDataMsg.fromJson(json['msg']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (msg != null) {
      data['msg'] = msg!.toJson();
    }
    return data;
  }
}

class Reorder {
/*
{
  "data": {
    "msg": {
      "message": "Order Has Been Added To Your Cart"
    }
  }
}
*/

  ReorderData? data;

  Reorder({
    this.data,
  });
  Reorder.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? ReorderData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
