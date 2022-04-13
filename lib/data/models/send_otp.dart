class SendOTPDataMsg {
/*
{
  "otp": 1854,
  "message": "Verification Code Send"
}
*/

  int? otp;
  String? message;

  SendOTPDataMsg({
    this.otp,
    this.message,
  });
  SendOTPDataMsg.fromJson(Map<String, dynamic> json) {
    otp = json['otp']?.toInt();
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['otp'] = otp;
    data['message'] = message;
    return data;
  }
}

class SendOTPData {
/*
{
  "msg": {
    "otp": 1854,
    "message": "Verification Code Send"
  }
}
*/

  SendOTPDataMsg? msg;

  SendOTPData({
    this.msg,
  });
  SendOTPData.fromJson(Map<String, dynamic> json) {
    msg = (json['msg'] != null) ? SendOTPDataMsg.fromJson(json['msg']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (msg != null) {
      data['msg'] = msg!.toJson();
    }
    return data;
  }
}

class SendOTP {
/*
{
  "data": {
    "msg": {
      "otp": 1854,
      "message": "Verification Code Send"
    }
  }
}
*/

  SendOTPData? data;

  SendOTP({
    this.data,
  });
  SendOTP.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? SendOTPData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
