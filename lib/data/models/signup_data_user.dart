class SignupDataUser {
/*
{
  "firstName": [
    "The first name field is required."
  ],
  "lastName": [
    "The last name field is required."
  ],
  "email": [
    "The email field is required."
  ],
  "password": [
    "The password field is required."
  ]
}
*/

  List<String>? firstName;
  List<String>? lastName;
  List<String>? email;
  List<String>? password;

  SignupDataUser({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });
  SignupDataUser.fromJson(Map<String, dynamic> json) {
    if (json['firstName'] != null) {
      final v = json['firstName'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      firstName = arr0;
    }
    if (json['lastName'] != null) {
      final v = json['lastName'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      lastName = arr0;
    }
    if (json['email'] != null) {
      final v = json['email'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      email = arr0;
    }
    if (json['password'] != null) {
      final v = json['password'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      password = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (firstName != null) {
      final v = firstName!;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['firstName'] = arr0;
    }
    if (lastName != null) {
      final v = lastName!;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['lastName'] = arr0;
    }
    if (email != null) {
      final v = email!;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['email'] = arr0;
    }
    if (password != null) {
      final v = password!;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['password'] = arr0;
    }
    return data;
  }
}
