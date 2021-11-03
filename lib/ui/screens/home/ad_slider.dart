import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdSlider extends StatelessWidget {
  const AdSlider({
    required this.ad_image,
    required this.ad_image_background,
    this.ad_text,
    this.ad_button_text,
    Key? key,
  }) : super(key: key);
  final String ad_image, ad_image_background;
  final String? ad_text, ad_button_text;
  // final Function onPress_button;

  @override
  Widget build(BuildContext context) {
    return
    Stack(
      children: <Widget>[
        Container(
          height: 170.h,
          width: 343.w,
          child: CachedNetworkImage(
            imageUrl:
            ad_image_background,
            imageBuilder: (context, imageProvider) => Container(
              height: 170.h,
              width: 343.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                  child:  CachedNetworkImage(
            imageUrl:
            ad_image,
            imageBuilder: (context, imageProvider) => Container(
              height: 112.h,
              width: 146.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                    ),
            ),
            ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 100.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            ad_text.toString() +  ad_text.toString() + ad_text.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            maxLines: 5,
                          ),
                        ),
                        Container(
                          child: Text(
                            ad_button_text.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
        ),
      ],
    );

  }
}
