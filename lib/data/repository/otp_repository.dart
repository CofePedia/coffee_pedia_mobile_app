import 'package:coffepedia/data/web_services/otp_web_services.dart';

class OTPRepository {
  final OTPWebServices otpWebServices;
  const OTPRepository(this.otpWebServices);

  // Future<SendOTP> postSendOTP(String mobile) async {
  //   final result = otpWebServices.postSendOTP(mobile);
  //   return result;
  // }
  //
  // Future<VerifyOTP> postVerifyOTP(String mobile, String otp) async {
  //   final result = otpWebServices.postVerifyOTP(mobile, otp);
  //   return result;
  // }
}
