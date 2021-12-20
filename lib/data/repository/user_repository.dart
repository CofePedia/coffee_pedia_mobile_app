import 'dart:async';

import 'package:coffepedia/data/models/login_data_user.dart';
import 'package:coffepedia/data/models/signup_data_user.dart';
import 'package:coffepedia/data/web_services/auth_web_services.dart';
import 'package:coffepedia/database/database_provider.dart';

class UserRepository {
  final userDao = UserDao();

  final AuthWebServices authWebServices;
  UserRepository(this.authWebServices);

  Future<LoginData> getToken(String email, String password) async {
    final userData = await authWebServices.getToken(email, password);

    return userData;
  }

  Future<Signup> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    print("$firstName");

    final signUpUserData = await authWebServices.signUp(
      firstName,
      lastName,
      email,
      password,
      passwordConfirmation,
    );
    return signUpUserData;
  }

  Future<void> persistToken({required LoginData user}) async {
    await userDao.createUser(user);
  }

  Future<void> deleteToken({required int id}) async {
    await userDao.deleteUser(id);
  }

  Future<bool> hasToken(int id) async {
    bool result = await userDao.checkSavedToken(id);
    return result;
  }

  Future<bool> checkUser(String token) async {
    bool result = await userDao.checkUser(token);
    return result;
  }
}
