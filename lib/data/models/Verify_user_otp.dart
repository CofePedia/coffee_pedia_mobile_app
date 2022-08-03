class VerifyUserOTP {
/*
{
  "success": true,
  "message": "You have successfully verified your phone number."
}
*/

  bool? success;
  String? message;

  VerifyUserOTP({
    this.success,
    this.message,
  });
  VerifyUserOTP.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
