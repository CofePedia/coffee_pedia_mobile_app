part of 'static_pages_cubit.dart';

@immutable
abstract class StaticPagesState {}

class StaticPagesInitial extends StaticPagesState {}

class PrivacyPolicyIsLoaded extends StaticPagesState {
  final StaticPage? staticPage;
  PrivacyPolicyIsLoaded(this.staticPage);
}

class TermsAndConditionsIsLoaded extends StaticPagesState {
  final StaticPage? staticPage;
  TermsAndConditionsIsLoaded(this.staticPage);
}
