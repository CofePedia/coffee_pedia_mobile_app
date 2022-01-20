part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class IsLogout extends LogoutState {
  final Logout? logout;
  IsLogout(this.logout);
}
