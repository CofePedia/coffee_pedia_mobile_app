import 'package:coffepedia/data/models/forgot_mobile.dart';
import 'package:coffepedia/data/models/send_otp.dart';
import 'package:coffepedia/data/models/update_password.dart';
import 'package:coffepedia/data/models/verify_otp.dart';
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

  Future<VerifyOTP> postVerifyNewPassword(String mobile, String otp) async {
    final result = forgotPasswordWebServices.postVerifyNewPassword(mobile, otp);
    return result;
  }

  Future<SendOTP> postSendOTP(String mobile) async {
    final result = forgotPasswordWebServices.postSendOTP(mobile);
    return result;
  }

  Future<VerifyOTP> postVerifyOTP(String mobile, String otp) async {
    final result = forgotPasswordWebServices.postVerifyOTP(mobile, otp);
    return result;
  }
}
