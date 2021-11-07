import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/ui/screens/home/card_category.dart';
import 'package:coffepedia/ui/screens/home/card_featured_products.dart';
import 'package:coffepedia/ui/screens/home/card_recent_products.dart';
import 'package:coffepedia/ui/screens/home/search_bar.dart';
import 'package:flutter/material.dart';

import 'home/ad.dart';
import 'home/ad_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            AdSlider(
              ad_image: "https://waffarha.com/images/main-cinema-1617716096.jpg",
              onPress: ontap,
            ),
            SizedBox(
              height: 20,
            ),
            Ad(
              ad_image_background:
                  "https://waffarha.com/images/app_banner/banner.JPG",
              onPress: ontap,
            ),
            SizedBox(
              height: 20,
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
            CardFeaturedProducts(
            product_image: "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png", 
            product_text: "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc", rate: 3.4, fav: true , price_after: "EGP 340", price_before: "EGP 450", discount: "25% Off",),
      
            SizedBox(
              height: 20,
            ),
            CardRecentProducts(
            product_image: "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png", 
            product_text: "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc", rate: 3.4, )
          ],
        )),
      ),
    );
  }

  ontap() {
    BotToast.showText(text: "ad slider");
  }
}
