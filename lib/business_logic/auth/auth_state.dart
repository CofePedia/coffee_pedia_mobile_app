part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticationUnintialized extends AuthState {}

class AuthenticationAuthenticated extends AuthState {}

class AuthenticationUnauthenticated extends AuthState {}

class AuthenticationLoading extends AuthState {}
