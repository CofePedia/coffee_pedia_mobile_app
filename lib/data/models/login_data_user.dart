class LoginDataUser {
/*
{
  "id": 1,
  "first_name": "Quemby",
  "last_name": "Hammond",
  "email": "shady.osama@waffarha.com",
  "mobile": "01023408535",
  "email_verified_at": "2021-11-09 22:00:00",
  "gender": "female",
  "birthdate": "2003-06-30",
  "remember_token": "Incididunt veritatis ipsum sed repellendus Laudantium ut officia quia et minim velit ea maiores",
  "created_at": "2021-11-03T22:00:00.000000Z",
  "updated_at": "2021-12-13T20:42:32.000000Z",
  "status": "Maxime dolores aut enim quibusdam incididunt aut neque accusantium commodi et id quae nemo consequat Enim doloribus labore blanditiis duis",
  "avatar": "https://api-staging.coffepidia.com/users/61b7b03845a6f.png",
  "name": "Quemby Hammond"
}
*/

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? emailVerifiedAt;
  String? gender;
  String? birthdate;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? avatar;
  String? name;

  LoginDataUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.emailVerifiedAt,
    this.gender,
    this.birthdate,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.avatar,
    this.name,
  });
  LoginDataUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    email = json['email']?.toString();
    mobile = json['mobile']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    gender = json['gender']?.toString();
    birthdate = json['birthdate']?.toString();
    rememberToken = json['remember_token']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    status = json['status']?.toString();
    avatar = json['avatar']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['email_verified_at'] = emailVerifiedAt;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['avatar'] = avatar;
    data['name'] = name;
    return data;
  }
}

class LoginData {
/*
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXN0YWdpbmcuY29mZmVwaWRpYS5jb21cL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjM5NDcxNjAzLCJleHAiOjE2Mzk0NzE2NjMsIm5iZiI6MTYzOTQ3MTYwMywianRpIjoibUtDcWhnNHg3QW9RZlNBcyIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.-9_W_PNLlLTKUuSbiwUHanqt40RGP5ct9YPeoLPBZYM",
  "token_type": "bearer",
  "user": {
    "id": 1,
    "first_name": "Quemby",
    "last_name": "Hammond",
    "email": "shady.osama@waffarha.com",
    "mobile": "01023408535",
    "email_verified_at": "2021-11-09 22:00:00",
    "gender": "female",
    "birthdate": "2003-06-30",
    "remember_token": "Incididunt veritatis ipsum sed repellendus Laudantium ut officia quia et minim velit ea maiores",
    "created_at": "2021-11-03T22:00:00.000000Z",
    "updated_at": "2021-12-13T20:42:32.000000Z",
    "status": "Maxime dolores aut enim quibusdam incididunt aut neque accusantium commodi et id quae nemo consequat Enim doloribus labore blanditiis duis",
    "avatar": "https://api-staging.coffepidia.com/users/61b7b03845a6f.png",
    "name": "Quemby Hammond"
  },
  "expires_in": 60
}
*/

  String? token;
  String? tokenType;
  LoginDataUser? user;
  int? expiresIn;

  LoginData({
    this.token,
    this.tokenType,
    this.user,
    this.expiresIn,
  });
  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token']?.toString();
    tokenType = json['token_type']?.toString();
    user = (json['user'] != null) ? LoginDataUser.fromJson(json['user']) : null;
    expiresIn = json['expires_in']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['token_type'] = tokenType;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['expires_in'] = expiresIn;
    return data;
  }
}

class Login {
/*
{
  "data": {
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXN0YWdpbmcuY29mZmVwaWRpYS5jb21cL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjM5NDcxNjAzLCJleHAiOjE2Mzk0NzE2NjMsIm5iZiI6MTYzOTQ3MTYwMywianRpIjoibUtDcWhnNHg3QW9RZlNBcyIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.-9_W_PNLlLTKUuSbiwUHanqt40RGP5ct9YPeoLPBZYM",
    "token_type": "bearer",
    "user": {
      "id": 1,
      "first_name": "Quemby",
      "last_name": "Hammond",
      "email": "shady.osama@waffarha.com",
      "mobile": "01023408535",
      "email_verified_at": "2021-11-09 22:00:00",
      "gender": "female",
      "birthdate": "2003-06-30",
      "remember_token": "Incididunt veritatis ipsum sed repellendus Laudantium ut officia quia et minim velit ea maiores",
      "created_at": "2021-11-03T22:00:00.000000Z",
      "updated_at": "2021-12-13T20:42:32.000000Z",
      "status": "Maxime dolores aut enim quibusdam incididunt aut neque accusantium commodi et id quae nemo consequat Enim doloribus labore blanditiis duis",
      "avatar": "https://api-staging.coffepidia.com/users/61b7b03845a6f.png",
      "name": "Quemby Hammond"
    },
    "expires_in": 60
  }
}
*/

  LoginData? data;

  Login({
    this.data,
  });
  Login.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? LoginData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
