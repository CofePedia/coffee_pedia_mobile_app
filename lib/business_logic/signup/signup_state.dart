part of 'signup_bloc.dart';

class SignupState {
  final String? firstName;
  bool get isValidFirstName => firstName!.length > 3;

  final String? lastName;
  bool get isValidLastName => lastName!.length > 3;

  final String? email;
  bool get isValidEmail => email!.contains('@');

  final String? password;
  bool get isValidPassword => password!.length > 6;

  final String? passwordConfirmation;
  bool get isValidPasswordConfirmation => passwordConfirmation!.length > 6;

  FormSubmissionStatus? formStatus;

  SignupState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.passwordConfirmation = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignupState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? passwordConfirmation,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final Object exception;

  SubmissionFailed(this.exception);
}
