part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final LoginData? user;
  const LoggedIn({required this.user});

  @override
  List<Object> get props => [user!];
  @override
  String toString() => 'LoggedIn { user: $user.username.toString() }';
}

// class LoggedOut extends AuthEvent {}
