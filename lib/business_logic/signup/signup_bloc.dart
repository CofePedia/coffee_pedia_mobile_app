import 'package:bloc/bloc.dart';
import 'package:coffepedia/business_logic/auth/auth_bloc.dart';
import 'package:coffepedia/business_logic/signup/form_submission_status.dart';
import 'package:coffepedia/data/repository/user_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;

  SignupBloc({
    required this.userRepository,
    required this.authBloc,
  }) : super(
          SignupState(),
        );

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    // firstName updated
    if (event is SignupFirstNameChanged) {
      yield state.copyWith(firstName: event.firstName);

      // lastName updated
    } else if (event is SignupLastNameChanged) {
      yield state.copyWith(lastName: event.lastName);

      // Email updated
    } else if (event is SignupEmailChanged) {
      yield state.copyWith(email: event.email);

      // Password updated
    } else if (event is SignupPasswordChanged) {
      yield state.copyWith(password: event.password);

      // PasswordConfirmation updated
    } else if (event is SignupPasswordConfirmationChanged) {
      yield state.copyWith(passwordConfirmation: event.passwordConfirmation);

      // Form submitted
    } else if (event is SignupSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        await userRepository.signUp(state.firstName!, state.lastName!,
            state.email!, state.password!, state.passwordConfirmation!);
        yield state.copyWith(
          formStatus: SubmissionSuccess(),
        );
      } catch (e) {
        yield state.copyWith(
          formStatus: SubmissionFailed(e),
        );
      }
    }
  }
}
