part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String password;
  final String mobile;

  const LoginButtonPressed({required this.password, required this.mobile});

  @override
  List<Object> get props => [password, mobile];

  @override
  String toString() =>
      'LoginButtonPressed {  password: $password, mobile: $mobile }';
}
