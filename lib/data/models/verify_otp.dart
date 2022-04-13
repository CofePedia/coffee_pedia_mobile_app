class VerifyOTPData {
/*
{
  "msg": "Confirmed"
}
*/

  String? msg;

  VerifyOTPData({
    this.msg,
  });
  VerifyOTPData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class VerifyOTP {
/*
{
  "data": {
    "msg": "Confirmed"
  }
}
*/

  VerifyOTPData? data;

  VerifyOTP({
    this.data,
  });
  VerifyOTP.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? VerifyOTPData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
