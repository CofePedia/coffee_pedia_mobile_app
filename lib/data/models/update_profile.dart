
import 'package:bot_toast/bot_toast.dart';

class UpdateProfile {
  Data? data;

  UpdateProfile({
    this.data,
  });
  UpdateProfile.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }

  UpdateProfile.refresh401(String res) {
          BotToast.showText(text: res);
  }
}

class Data {
  String? msg;

  Data({
    this.msg,
  });
  Data.fromJson(Map<String, dynamic> json) {
    msg = (json['msg'] != null) ? json['msg']: null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}
