import 'package:flutter/material.dart';

import 'ad_slider_screen.dart';

class HomeScreenPage extends StatefulWidget {

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Container(
        child: AdSliderScreen(ad_image: "https://waffarha.com/images/main-cinema-1617716096.jpg", ad_button_text: "Shop Now", ad_text: "Get More Than",)
      ),
    );
  }
}
