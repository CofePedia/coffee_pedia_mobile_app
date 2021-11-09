import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/ui/screens/home/ads.dart';
import 'home/brands_icons.dart';
import 'home/card_category.dart';
import 'home/card_featured_products.dart';
import 'home/card_recent_products.dart';
import 'home/search_bar.dart';
import 'home/section_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home/ad_banner.dart';
import 'home/ad_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdSlider(
              ad_image: "https://waffarha.com/images/main-cinema-1617716096.jpg",
              onPress: ontap,
            ),
            SizedBox(
              height: 20,
            ),
            AdBanner(
              ad_image_background:
                  "https://waffarha.com/images/app_banner/banner.JPG",
              onPress: ontap,
            ),
            SizedBox(
              height: 20,
            ),
            SecationName(section_name: "Shop By Category"),
            SizedBox(
              height: 10,
            ),
            CardCategory(
              category_image:
                  "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
              category_image_background:
                  "https://www.pngmagic.com/product_images/beautiful-blue-color-background.png",
              category_name: "coffee",
            ),
            SizedBox(
              height: 20,
            ),
            SecationName(section_name: "Featured Products"),
            SizedBox(
              height: 10,
            ),
            CardFeaturedProducts(
            product_image: "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png", 
            product_text: "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc"),  
            SizedBox(
              height: 20,
            ),
            SecationName(section_name: "Shop By Brands"),
            SizedBox(
              height: 10,
            ),
            BrandsIcons(brand_icon: "https://waffarha.com/images/uploads/Cinnabon-Logo-logo-1630228283.png"),
            SizedBox(
              height: 20,
            ),
            Ads(ad_image_background: "https://waffarha.com/images/Cinnabon-main3-1630254257.jpg"),
            SizedBox(
              height: 10,
            ),
            Ads(ad_image_background: "https://waffarha.com/images/Cinnabon-main-1630254288.jpg"),
            SizedBox(
              height: 20,
            ),
            SecationName(section_name: "Most Recent Products"),
            SizedBox(
              height: 10,
            ),
            CardRecentProducts(
            product_image: "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png", 
            product_text: "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc" )
          ],
        )),
      ),
    );
  }

  ontap() {
    BotToast.showText(text: "ad slider");
  }
}
