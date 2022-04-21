part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class PasswordCodeIsSent extends ForgotPasswordState {
  final ForgotMobile? forgotMobile;
  PasswordCodeIsSent(this.forgotMobile);
}

class UpdatePasswordIsPressed extends ForgotPasswordState {
  final UpdatePassword? updatePassword;
  UpdatePasswordIsPressed(this.updatePassword);
}

class SendOTPIsPressed extends ForgotPasswordState {
  final SendOTP? sendOTP;
  SendOTPIsPressed(this.sendOTP);
}

class VerifyCodeIsSent extends ForgotPasswordState {
  final VerifyOTP? verifyOTP;
  VerifyCodeIsSent(this.verifyOTP);
}

class VerifyCodeIsFalse extends ForgotPasswordState {
  final Exception? error;
  VerifyCodeIsFalse(this.error);
}

class VerifyNewPasswordIsSent extends ForgotPasswordState {
  final VerifyOTP? verifyOTP;
  VerifyNewPasswordIsSent(this.verifyOTP);
}

class VerifyNewPasswordIsFalse extends ForgotPasswordState {
  final Exception? error;
  VerifyNewPasswordIsFalse(this.error);
}
