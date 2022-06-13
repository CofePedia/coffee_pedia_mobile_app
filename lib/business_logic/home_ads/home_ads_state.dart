part of 'home_ads_cubit.dart';

@immutable
abstract class HomeAdsState {}

class HomeAdsInitial extends HomeAdsState {}

class HomeAdsLoaded extends HomeAdsState {
  final HomeAds? homeAds;
  HomeAdsLoaded(this.homeAds);
}

class HomeSlidersLoaded extends HomeAdsState {
  final HomeSliders? homeSliders;
  HomeSlidersLoaded(this.homeSliders);
}
