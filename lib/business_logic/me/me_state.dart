part of 'me_cubit.dart';

abstract class MeState extends Equatable {
  const MeState();

  @override
  List<Object> get props => [];
}

class MeInitial extends MeState {}

class MeIsLoaded extends MeState {
  final Me? me;
  MeIsLoaded(this.me);
}