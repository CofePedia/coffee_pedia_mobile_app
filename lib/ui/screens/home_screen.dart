import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/ui/screens/home/ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/ad_banner.dart';
import 'home/ad_slider.dart';
import 'home/brands_icons.dart';
import 'home/card_category.dart';
import 'home/card_featured_products.dart';
import 'home/card_recent_products.dart';
import 'home/search_bar.dart';
import 'home/section_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                bottom: 9.h,
                top: 53.h,
              ),
              height: 105.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFFD008),
                    Color(0xffFFE77E),
                  ],
                ),
              ),
              child: SearchBar(),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 170.h,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return AdSlider(
                    ad_image: "https://waffarha.com/images/main-cinema-1617716096.jpg",
                    onPress: onTap,
                  );
                },
              ),
            ),
            AdBanner(
              adImageBackground: "https://waffarha.com/images/app_banner/banner.JPG",
              onPress: onTap,
            ),
            SecationName(section_name: "Shop By Category"),
            CardCategory(
              category_image:
                  "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
              category_image_background: "https://www.pngmagic.com/product_images/beautiful-blue-color-background.png",
              category_name: "coffee",
            ),
            SecationName(section_name: "Featured Products"),
            CardFeaturedProducts(
                product_image:
                    "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                product_text: "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc"),
            SecationName(section_name: "Shop By Brands"),
            BrandsIcons(brandIcon: "https://waffarha.com/images/uploads/Cinnabon-Logo-logo-1630228283.png"),
            Ads(ad_image_background: "https://waffarha.com/images/Cinnabon-main3-1630254257.jpg"),
            Ads(ad_image_background: "https://waffarha.com/images/Cinnabon-main-1630254288.jpg"),
            SecationName(section_name: "Most Recent Products"),
            CardRecentProducts(
                product_image:
                    "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                product_text: "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc")
          ],
        ),
      ),
    );
  }

  onTap() {
    BotToast.showText(text: "ad slider");
  }
}
