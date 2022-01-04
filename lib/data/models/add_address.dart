class AddAddressData {
/*
{
  "msg": "address_added_successfully"
}
*/

  String? msg;

  AddAddressData({
    this.msg,
  });
  AddAddressData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class AddAddress {
/*
{
  "data": {
    "msg": "address_added_successfully"
  }
}
*/

  AddAddressData? data;

  AddAddress({
    this.data,
  });
  AddAddress.fromJson(Map<String, dynamic> json) {
    data =
        (json['data'] != null) ? AddAddressData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
