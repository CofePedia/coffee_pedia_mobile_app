class DeleteAddressData {
/*
{
  "msg": "Address Deleted Successfully"
}
*/

  String? msg;

  DeleteAddressData({
    this.msg,
  });
  DeleteAddressData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class DeleteAddress {
/*
{
  "data": {
    "msg": "Address Deleted Successfully"
  }
}
*/

  DeleteAddressData? data;

  DeleteAddress({
    this.data,
  });
  DeleteAddress.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? DeleteAddressData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
