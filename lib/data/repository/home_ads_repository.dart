import 'package:coffepedia/data/models/featured_products.dart';
import 'package:coffepedia/data/models/home_ads.dart';
import 'package:coffepedia/data/web_services/home_ads_web_services.dart';

class HomeAdsRepository {
  final HomeAdsWebServices homeAdsWebServices;

  HomeAdsRepository(this.homeAdsWebServices);

  Future<HomeAds> getHomeAds() async {
    final homeAds = homeAdsWebServices.getHomeAds();
    return homeAds;
  }

  Future<FeaturedProducts> getFeaturedProducts() async {
    final featuredProducts = homeAdsWebServices.getFeaturedProducts();
    return featuredProducts;
  }
}
