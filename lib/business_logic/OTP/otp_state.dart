part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

// class SendOTPIsPressed extends OtpState {
//   final SendOTP? sendOTP;
//   SendOTPIsPressed(this.sendOTP);
// }
//
// class VerifyCodeIsSent extends OtpState {
//   final VerifyOTP? verifyOTP;
//   VerifyCodeIsSent(this.verifyOTP);
// }
//
// class VerifyCodeIsFalse extends OtpState {
//   final Exception? error;
//   VerifyCodeIsFalse(this.error);
// }
