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
