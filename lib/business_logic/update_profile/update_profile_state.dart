
import 'package:coffepedia/data/models/update_profile.dart';
import 'package:equatable/equatable.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileIsLoaded extends UpdateProfileState {
  final UpdateProfile? updateProfile;
  UpdateProfileIsLoaded(this.updateProfile);
}

