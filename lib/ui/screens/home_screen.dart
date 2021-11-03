import 'package:coffepedia/ui/screens/home/card_category.dart';
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
        title: 
        SearchBar(),
        backgroundColor: Colors.white,
        ),
      body: Container(
      child: Column(
        children: [
          AdSlider(ad_image_background: "https://waffarha.com/images/main-cinema-1617716096.jpg", ad_button_text: "Shop Now", ad_text: "Get More Than", ad_image: "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",),
          SizedBox(
            height: 20,
          ),
          Ad(ad_image_background: "https://waffarha.com/images/app_banner/banner.JPG",),
          SizedBox(
            height: 20,
          ),
          CardCategory(category_image: "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png", category_image_background:  "https://www.pngmagic.com/product_images/beautiful-blue-color-background.png", category_text: "coffee",)
        ],
      )
      ),
    );
  }
}
