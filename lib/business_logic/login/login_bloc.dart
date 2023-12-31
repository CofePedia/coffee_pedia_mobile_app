import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffepedia/business_logic/auth/auth_bloc.dart';
import 'package:coffepedia/data/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/login_data_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({
    required this.userRepository,
    required this.authBloc,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final user = await userRepository.getToken(
          event.password,
          event.mobile,
        );

        authBloc.add(LoggedIn(user: user));

        yield LoginSuccess(user: user);
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
