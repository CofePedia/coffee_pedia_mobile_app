import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/repository/otp_repository.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OTPRepository otpRepository;

  OtpCubit(this.otpRepository) : super(OtpInitial());

  // void postSendOTP(String mobile) {
  //   otpRepository.postSendOTP(mobile).then(
  //     (value) {
  //       emit(SendOTPIsPressed(value));
  //     },
  //   );
  // }
  //
  // void postVerifyOTP(String mobile, String otp) {
  //   otpRepository
  //       .postVerifyOTP(mobile, otp)
  //       .then((value) => emit(
  //             VerifyCodeIsSent(value),
  //           ))
  //       .catchError(
  //         (error) => emit(
  //           VerifyCodeIsFalse(error),
  //         ),
  //       );
  // }
}
