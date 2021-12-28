import 'login_data_user.dart';


class Me {
  LoginDataUser? data;

  Me({
    this.data,
  });
  Me.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? LoginDataUser.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
