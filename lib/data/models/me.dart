import 'login_data_user.dart';


class MeModel {
  LoginDataUser? data;

  MeModel({
    this.data,
  });
  MeModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? LoginDataUser.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
