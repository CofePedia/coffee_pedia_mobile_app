///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class SignupDataUser {
/*
{
  "first_name": "Amr",
  "last_name": "Azzam",
  "email": "amrazzam101@waffarha.com",
  "mobile": "01063608396",
  "updated_at": "2022-03-20T09:21:12.000000Z",
  "created_at": "2022-03-20T09:21:12.000000Z",
  "id": 77,
  "code": 5521,
  "name": "Amr Azzam"
}
*/

  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? code;
  String? name;

  SignupDataUser({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.code,
    this.name,
  });
  SignupDataUser.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
    code = json['code']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class SignupData {
/*
{
  "user": {
    "first_name": "Amr",
    "last_name": "Azzam",
    "email": "amrazzam101@waffarha.com",
    "mobile": "01063608396",
    "updated_at": "2022-03-20T09:21:12.000000Z",
    "created_at": "2022-03-20T09:21:12.000000Z",
    "id": 77,
    "code": 5521,
    "name": "Amr Azzam"
  },
  "message": "CREATED"
}
*/

  SignupDataUser? user;
  String? message;

  SignupData({
    this.user,
    this.message,
  });
  SignupData.fromJson(Map<String, dynamic> json) {
    user =
        (json['user'] != null) ? SignupDataUser.fromJson(json['user']) : null;
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Signup {
/*
{
  "data": {
    "user": {
      "first_name": "Amr",
      "last_name": "Azzam",
      "email": "amrazzam101@waffarha.com",
      "mobile": "01063608396",
      "updated_at": "2022-03-20T09:21:12.000000Z",
      "created_at": "2022-03-20T09:21:12.000000Z",
      "id": 77,
      "code": 5521,
      "name": "Amr Azzam"
    },
    "message": "CREATED"
  }
}
*/

  SignupData? data;

  Signup({
    this.data,
  });
  Signup.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? SignupData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
