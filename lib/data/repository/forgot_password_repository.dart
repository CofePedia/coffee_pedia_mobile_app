import 'package:coffepedia/data/models/forgot_mobile.dart';
import 'package:coffepedia/data/models/update_password.dart';
import 'package:coffepedia/data/web_services/forgot_password_web_services.dart';

class ForgotPasswordRepository {
  final ForgotPasswordWebServices forgotPasswordWebServices;
  const ForgotPasswordRepository(this.forgotPasswordWebServices);

  Future<ForgotMobile> postForgotMobile(String mobile) async {
    final result = forgotPasswordWebServices.postForgotMobile(mobile);
    return result;
  }

  Future<UpdatePassword> postUpdatePassword(
    String mobile,
    String code,
    String password,
    String passwordConfirmation,
  ) async {
    final result = forgotPasswordWebServices.postUpdatePassword(
        mobile, code, password, passwordConfirmation);
    return result;
  }
}
