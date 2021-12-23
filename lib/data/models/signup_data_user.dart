///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class SignupDataUser {
/*
{
  "first_name": "Islam",
  "last_name": "Osama",
  "email": "amrazzam3561@waffarha.com",
  "updated_at": "2021-12-20T12:29:10.000000Z",
  "created_at": "2021-12-20T12:29:10.000000Z",
  "id": 26,
  "name": "Islam Osama"
}
*/

  late String firstName;
  late String lastName;
  late String email;
  String? updatedAt;
  String? createdAt;
  late int id;
  late String name;

  SignupDataUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.updatedAt,
    this.createdAt,
    required this.id,
    required this.name,
  });
  SignupDataUser.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'].toString();
    lastName = json['last_name'].toString();
    email = json['email'].toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id'].toInt();
    name = json['name'].toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class SignupData {
/*
{
  "user": {
    "first_name": "Islam",
    "last_name": "Osama",
    "email": "amrazzam3561@waffarha.com",
    "updated_at": "2021-12-20T12:29:10.000000Z",
    "created_at": "2021-12-20T12:29:10.000000Z",
    "id": 26,
    "name": "Islam Osama"
  },
  "message": "CREATED"
}
*/

  late SignupDataUser user;
  String? message;

  SignupData({
    required this.user,
    this.message,
  });
  SignupData.fromJson(Map<String, dynamic> json) {
    user = SignupDataUser.fromJson(json['user']);
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['message'] = message;
    return data;
  }
}

class Signup {
/*
{
  "data": {
    "user": {
      "first_name": "Islam",
      "last_name": "Osama",
      "email": "amrazzam3561@waffarha.com",
      "updated_at": "2021-12-20T12:29:10.000000Z",
      "created_at": "2021-12-20T12:29:10.000000Z",
      "id": 26,
      "name": "Islam Osama"
    },
    "message": "CREATED"
  }
}
*/

  late SignupData data;

  Signup({
    required this.data,
  });
  Signup.fromJson(Map<String, dynamic> json) {
    data = SignupData.fromJson(json['data']);
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    return data;
  }
}
