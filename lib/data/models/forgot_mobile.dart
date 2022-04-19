class ForgotMobileData {
/*
{
  "msg": "Reset Code sent on as Sms"
}
*/

  String? msg;

  ForgotMobileData({
    this.msg,
  });
  ForgotMobileData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class ForgotMobile {
/*
{
  "data": {
    "msg": "Reset Code sent on as Sms"
  }
}
*/

  ForgotMobileData? data;

  ForgotMobile({
    this.data,
  });
  ForgotMobile.fromJson(Map<String, dynamic> json) {
    data =
        (json['data'] != null) ? ForgotMobileData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
