part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginData? user;
  const LoginSuccess({required this.user});
}

class LoginFailure extends LoginState {
  final String? error;

  const LoginFailure({this.error});

  @override
  List<Object> get props => [error!];

  @override
  String toString() => ' LoginFaliure { error: $error }';
}
