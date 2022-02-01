import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/logout.dart';
import 'package:coffepedia/data/models/me.dart';
import 'package:coffepedia/data/repository/me_repository.dart';
import 'package:equatable/equatable.dart';

part 'me_state.dart';

class MeCubit extends Cubit<MeState> {
  final MeRepository meRepository;

  MeCubit(this.meRepository) : super(MeInitial());
  void getMe() {
    meRepository.getMe().then(
      (value) {
        emit(MeIsLoaded(value));
      },
    );
  }

  void logout() {
    meRepository.logout().then(
      (value) {
        emit(IsLogout(value));
      },
    );
  }
}
