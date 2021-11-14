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
              child: SearchBar(
                width: 345.w,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: AdSlider(
                ad_image:
                    "https://waffarha.com/images/main-cinema-1617716096.jpg",
                onPress: onTap,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AdBanner(
              adImageBackground:
                  "https://waffarha.com/images/app_banner/banner.JPG",
              onPress: onTap,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SecationName(section_name: "Shop By Category"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CardCategory(
                category_image:
                    "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                category_image_background:
                    "https://www.pngmagic.com/product_images/beautiful-blue-color-background.png",
                category_name: "coffee",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SecationName(section_name: "Featured Products"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CardFeaturedProducts(
                  product_image:
                      "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                  product_text:
                      "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc"),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SecationName(section_name: "Shop By Brands"),
            ),
            SizedBox(
              height: 10,
            ),
            BrandsIcons(
                brandIcon:
                    "https://waffarha.com/images/uploads/Cinnabon-Logo-logo-1630228283.png"),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Ads(
                  ad_image_background:
                      "https://waffarha.com/images/Cinnabon-main3-1630254257.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Ads(
                  ad_image_background:
                      "https://waffarha.com/images/Cinnabon-main-1630254288.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: SecationName(section_name: "Most Recent Products"),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: CardRecentProducts(
                  product_image:
                      "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                  product_text:
                      "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc"),
            )
          ],
        ),
      ),
    );
  }

  onTap() {
    BotToast.showText(text: "ad slider");
  }
}
