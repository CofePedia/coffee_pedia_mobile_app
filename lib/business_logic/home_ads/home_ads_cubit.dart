import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/home_ads.dart';
import 'package:coffepedia/data/repository/home_ads_repository.dart';
import 'package:meta/meta.dart';

part 'home_ads_state.dart';

class HomeAdsCubit extends Cubit<HomeAdsState> {
  final HomeAdsRepository homeAdsRepository;

  HomeAdsCubit(this.homeAdsRepository) : super(HomeAdsInitial());

  void getHomeAds() {
    homeAdsRepository.getHomeAds().then(
          (value) => emit(HomeAdsLoaded()),
        );
  }
}
