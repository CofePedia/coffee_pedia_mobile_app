part of 'most_recent_cubit.dart';

@immutable
abstract class MostRecentState {}

class MostRecentInitial extends MostRecentState {}

class MostRecentLoaded extends MostRecentState {
  final MostRecent? mostRecent;
  MostRecentLoaded(this.mostRecent);
}
