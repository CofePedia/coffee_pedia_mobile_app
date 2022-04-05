import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/aboutCofePedia.dart';
import 'package:coffepedia/data/repository/about_cofepedia_repository.dart';
import 'package:meta/meta.dart';

part 'about_cofepedia_state.dart';

class AboutCofepediaCubit extends Cubit<AboutCofepediaState> {
  final AboutCofepediaRepository aboutCofepediaRepository;
  AboutCofepediaCubit(this.aboutCofepediaRepository)
      : super(AboutCofepediaInitial());

  void getAboutCofepedia() {
    aboutCofepediaRepository.getAboutCofepedia().then(
      (value) {
        emit(AboutCofepediaIsLoaded(value));
      },
    );
  }
}
