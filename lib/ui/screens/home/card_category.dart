import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    required this.category_image,
    required this.category_image_background,
    required this.category_text,
    Key? key,
  }) : super(key: key);
  final String category_image, category_image_background, category_text;
  // final Function onPress_button;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 100.h,
          width: 150.w,
          child: CachedNetworkImage(
            imageUrl: category_image_background,
            imageBuilder: (context, imageProvider) => Container(
              height: 84.h,
              width: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      category_text.toString() ,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                Container(
                    child: CachedNetworkImage(
                      imageUrl: category_image,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 80.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
