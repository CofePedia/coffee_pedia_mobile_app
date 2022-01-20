class LogoutData {
/*
{
  "msg": "Successfully logged out"
}
*/

  String? msg;

  LogoutData({
    this.msg,
  });
  LogoutData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class Logout {
/*
{
  "data": {
    "msg": "Successfully logged out"
  }
}
*/

  LogoutData? data;

  Logout({
    this.data,
  });
  Logout.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? LogoutData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
