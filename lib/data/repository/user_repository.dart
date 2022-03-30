import 'dart:async';

import 'package:coffepedia/data/models/login_data_user.dart';
import 'package:coffepedia/data/models/signup_data_user.dart';
import 'package:coffepedia/data/web_services/auth_web_services.dart';
import 'package:coffepedia/database/database_provider.dart';

class UserRepository {
  final userDao = UserDao();

  final AuthWebServices authWebServices;
  UserRepository(this.authWebServices);

  Future<LoginData> getToken(
    String password,
    String mobile,
  ) async {
    final userData = await authWebServices.getToken(password, mobile);

    return userData;
  }

  Future<Signup> signUp({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? mobile,
  }) async {
    final signUpUserData = await authWebServices.signUp(
      firstName: firstName!,
      lastName: lastName!,
      email: email!,
      password: password!,
      passwordConfirmation: passwordConfirmation!,
      mobile: mobile!,
    );
    return signUpUserData;
  }

  Future<void> persistToken({required LoginData user}) async {
    await userDao.createUser(user);
  }

  // Future<void> deleteToken({required int id}) async {
  //   await userDao.deleteUser(id);
  // }

  Future<bool> hasToken(int id) async {
    bool result = await userDao.checkSavedToken(id);
    return result;
  }

  Future<bool> checkUser(String token) async {
    bool result = await userDao.checkUser(token);
    return result;
  }
}
