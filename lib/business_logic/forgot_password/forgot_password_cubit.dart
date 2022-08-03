import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/forgot_mobile.dart';
import 'package:coffepedia/data/models/send_otp.dart';
import 'package:coffepedia/data/models/update_password.dart';
import 'package:coffepedia/data/models/verify_otp.dart';
import 'package:coffepedia/data/repository/forgot_password_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/Verify_user_otp.dart';

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

  void postSendOTP(String mobile) {
    forgotPasswordRepository.postSendOTP(mobile).then(
      (value) {
        emit(SendOTPIsPressed(value));
      },
    );
  }

  void postVerifyOTP(String mobile, String otp) {
    forgotPasswordRepository
        .postVerifyOTP(mobile, otp)
        .then((value) => emit(
              VerifyCodeIsSent(value),
            ))
        .catchError(
          (error) => emit(
            VerifyCodeIsFalse(error),
          ),
        );
  }

  void postVerifyNewPassword(String mobile, String otp) {
    forgotPasswordRepository
        .postVerifyNewPassword(mobile, otp)
        .then((value) => emit(
              VerifyNewPasswordIsSent(value),
            ))
        .catchError(
          (error) => emit(
            VerifyNewPasswordIsFalse(error),
          ),
        );
  }
}
