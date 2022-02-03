class UpdateAddressData {
/*
{
  "msg": "Address updated Successfully"
}
*/

  String? msg;

  UpdateAddressData({
    this.msg,
  });
  UpdateAddressData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class UpdateAddress {
/*
{
  "data": {
    "msg": "Address updated Successfully"
  }
}
*/

  UpdateAddressData? data;

  UpdateAddress({
    this.data,
  });
  UpdateAddress.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? UpdateAddressData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
