class VendorRegisterDataUser {
/*
{
  "first_name": "Islam",
  "last_name": "Osama",
  "email": "isla1.osama@waffarha.com",
  "mobile": null,
  "updated_at": "2022-07-05T08:19:20.000000Z",
  "created_at": "2022-07-05T08:19:20.000000Z",
  "id": 204,
  "name": "Islam Osama"
}
*/

  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? name;

  VendorRegisterDataUser({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.name,
  });
  VendorRegisterDataUser.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    updatedAt = json['updated_at']?.toString();
    createdAt = json['created_at']?.toString();
    id = json['id']?.toInt();
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
    data['name'] = name;
    return data;
  }
}

class VendorRegisterData {
/*
{
  "user": {
    "first_name": "Islam",
    "last_name": "Osama",
    "email": "isla1.osama@waffarha.com",
    "mobile": null,
    "updated_at": "2022-07-05T08:19:20.000000Z",
    "created_at": "2022-07-05T08:19:20.000000Z",
    "id": 204,
    "name": "Islam Osama"
  },
  "message": "CREATED"
}
*/

  VendorRegisterDataUser? user;
  String? message;

  VendorRegisterData({
    this.user,
    this.message,
  });
  VendorRegisterData.fromJson(Map<String, dynamic> json) {
    user = (json['user'] != null)
        ? VendorRegisterDataUser.fromJson(json['user'])
        : null;
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

class VendorRegister {
/*
{
  "data": {
    "user": {
      "first_name": "Islam",
      "last_name": "Osama",
      "email": "isla1.osama@waffarha.com",
      "mobile": null,
      "updated_at": "2022-07-05T08:19:20.000000Z",
      "created_at": "2022-07-05T08:19:20.000000Z",
      "id": 204,
      "name": "Islam Osama"
    },
    "message": "CREATED"
  }
}
*/

  VendorRegisterData? data;

  VendorRegister({
    this.data,
  });
  VendorRegister.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? VendorRegisterData.fromJson(json['data'])
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
