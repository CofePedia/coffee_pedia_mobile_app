import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/repository/update_profile_repository.dart';

import 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepository updateProfileRepository;
  UpdateProfileCubit(this.updateProfileRepository)
      : super(UpdateProfileInitial());
  void getUpdateProfile(String? firstName , String? lastName, String? email , String? password , File? profilePicture) {
    updateProfileRepository.getUpdateProfile(firstName, lastName, email, password, profilePicture).then(
      (value) {
        emit(UpdateProfileIsLoaded(value));
      },
    );
  }
}
