part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  final String mobile;

  const LoginButtonPressed(
      {required this.email, required this.password, required this.mobile});

  @override
  List<Object> get props => [email, password, mobile];

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password, mobile: $mobile }';
}
