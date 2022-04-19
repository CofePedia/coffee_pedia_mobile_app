class UpdatePasswordData {
/*
{
  "msg": "Password Updated Successfully"
}
*/

  String? msg;

  UpdatePasswordData({
    this.msg,
  });
  UpdatePasswordData.fromJson(Map<String, dynamic> json) {
    msg = json['msg']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class UpdatePassword {
/*
{
  "data": {
    "msg": "Password Updated Successfully"
  }
}
*/

  UpdatePasswordData? data;

  UpdatePassword({
    this.data,
  });
  UpdatePassword.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? UpdatePasswordData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
