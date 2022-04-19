import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/forgot_mobile.dart';
import 'package:coffepedia/data/models/update_password.dart';
import 'package:coffepedia/data/repository/forgot_password_repository.dart';
import 'package:meta/meta.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepository forgotPasswordRepository;
  ForgotPasswordCubit(this.forgotPasswordRepository)
      : super(ForgotPasswordInitial());

  void postForgotMobile(String mobile) {
    forgotPasswordRepository.postForgotMobile(mobile).then(
      (value) {
        emit(PasswordCodeIsSent(value));
      },
    );
  }

  void postUpdatePassword(
    String mobile,
    String code,
    String password,
    String passwordConfirmation,
  ) {
    forgotPasswordRepository
        .postUpdatePassword(mobile, code, password, passwordConfirmation)
        .then((value) => emit(
              UpdatePasswordIsPressed(value),
            ));
  }
}
