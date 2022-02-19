part of 'me_cubit.dart';

abstract class MeState extends Equatable {
  const MeState();

  @override
  List<Object> get props => [];
}

class MeInitial extends MeState {}

class MeIsLoaded extends MeState {
  final MeModel? me;
  MeIsLoaded(this.me);
}

class MeIsNotExist extends MeState {
  MeIsNotExist();
}

class IsLogout extends MeState {
  final Logout? logout;
  IsLogout(this.logout);
}
