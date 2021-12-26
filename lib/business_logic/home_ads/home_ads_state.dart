part of 'home_ads_cubit.dart';

@immutable
abstract class HomeAdsState {}

class HomeAdsInitial extends HomeAdsState {}

class HomeAdsLoaded extends HomeAdsState {
  final HomeAds? homeAds;
  HomeAdsLoaded(this.homeAds);
}
