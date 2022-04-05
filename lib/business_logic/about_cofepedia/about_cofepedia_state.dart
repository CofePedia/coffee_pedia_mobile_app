part of 'about_cofepedia_cubit.dart';

@immutable
abstract class AboutCofepediaState {}

class AboutCofepediaInitial extends AboutCofepediaState {}

class AboutCofepediaIsLoaded extends AboutCofepediaState {
  final AboutCofePedia? aboutCofePedia;
  AboutCofepediaIsLoaded(this.aboutCofePedia);
}
