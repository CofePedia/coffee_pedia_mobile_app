import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/static_pages.dart';
import 'package:coffepedia/data/repository/static_pages_repository.dart';
import 'package:meta/meta.dart';

part 'static_pages_state.dart';

class StaticPagesCubit extends Cubit<StaticPagesState> {
  final StaticPagesRepository staticPagesRepository;
  StaticPagesCubit(this.staticPagesRepository) : super(StaticPagesInitial());

  void getPrivacyPolicy() {
    staticPagesRepository.getPrivacyPolicy().then(
      (value) {
        emit(PrivacyPolicyIsLoaded(value));
      },
    );
  }

  void getTermsAndConditions() {
    staticPagesRepository.getTermsAndConditions().then(
      (value) {
        emit(TermsAndConditionsIsLoaded(value));
      },
    );
  }
}
