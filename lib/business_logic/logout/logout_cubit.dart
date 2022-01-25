// import 'package:bloc/bloc.dart';
// import 'package:coffepedia/data/models/logout.dart';
// import 'package:coffepedia/data/repository/user_repository.dart';
// import 'package:meta/meta.dart';
//
// part 'logout_state.dart';
//
// class LogoutCubit extends Cubit<LogoutState> {
//   final UserRepository userRepository;
//   LogoutCubit(this.userRepository) : super(LogoutInitial());
//
//   void logout() {
//     userRepository.logout().then(
//       (value) {
//         emit(IsLogout(value));
//       },
//     );
//   }
// }
