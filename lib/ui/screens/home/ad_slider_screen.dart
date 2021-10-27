import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AdSliderScreen extends StatelessWidget {
  const AdSliderScreen({
    required this.ad_image,
    this.ad_text,
    this.ad_button_text,
    Key? key, 
  }) : super(key: key);
  final String ad_image;
  final String? ad_text;
  final String? ad_button_text;
  // final Function onPress_button;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 343,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: ad_image,
          ),
          Column(
            children: [
              Container(
                child: Text(ad_text.toString() , 
                style: TextStyle(color: Colors.white , 
                fontSize: 22
                ),)),
              Container(
                child: Text(ad_button_text.toString() , 
                style: TextStyle(color: Colors.blue , 
                decoration: TextDecoration.underline, fontSize: 14,
                ),)),
            ],
          )
        ],
      ),
    );
  }
}
