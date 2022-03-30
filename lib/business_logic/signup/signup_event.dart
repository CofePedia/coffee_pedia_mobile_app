part of 'signup_bloc.dart';

abstract class SignupEvent {}

class SignupFirstNameChanged extends SignupEvent {
  final String? firstName;

  SignupFirstNameChanged({this.firstName});
}

class SignupLastNameChanged extends SignupEvent {
  final String? lastName;

  SignupLastNameChanged({this.lastName});
}

class SignupEmailChanged extends SignupEvent {
  final String? email;

  SignupEmailChanged({this.email});
}

class SignupMobileChanged extends SignupEvent {
  final String? mobile;

  SignupMobileChanged({this.mobile});
}

class SignupPasswordChanged extends SignupEvent {
  final String? password;

  SignupPasswordChanged({this.password});
}

class SignupPasswordConfirmationChanged extends SignupEvent {
  final String? passwordConfirmation;

  SignupPasswordConfirmationChanged({this.passwordConfirmation});
}

class SignupSubmitted extends SignupEvent {}
