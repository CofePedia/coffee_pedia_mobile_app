import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home/card_featured_products.dart';

class ReviewDetailsScreen extends StatelessWidget {
  const ReviewDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          controller: controller,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 24.h,
                left: 23.w,
                right: 23.w,
              ),
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(
              height: 27.48.h,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 212.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFFFFFF),
                        Color(0xff231F20),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7.r),
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        Assets.coffeeCars,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 157.33.h,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30.62.w,
                        child: Divider(
                          color: Color(0xffFFFFFF),
                          thickness: 3.38.h,
                        ),
                      ),
                      SizedBox(
                        width: 280.w,
                        child: Divider(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          thickness: 3.38.h,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 175.33.h,
                  left: 30.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 30.h,
                      ),
                      SizedBox(
                        width: 25.3.w,
                      ),
                      Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 30.h,
                      ),
                      SizedBox(
                        width: 22.w,
                      ),
                      Text(
                        '00:53 / 05:33',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(
                        width: 35.w,
                      ),
                      Icon(
                        Icons.volume_up,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      SvgPicture.asset(
                        Assets.fullscreenIcon,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 17.75.w,
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            // change font
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'The Olympia Cremina',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'We have seen increased interest in our Olympia Cremina model.  Watch this video review and find out what independent expert James Hoffman has to say.',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Founded in 2018 as a roaster selling only online, the pandemic tripled business practically overnight and in mid-2020, they were offered a spot in the newly formed Outer Sunset Farmers Market. It quickly became clear between multiple daily load-ins and outs that a mobile unit was needed.',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Products in this video',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              height: 41.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 262.h,
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.only(
                  left: 8.w,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: CardFeaturedProducts(
                        productImage:
                            "https://www.philips.sa/c-dam/b2c/category-pages/Household/coffee/master/philips-superautomatic/mea-2017/HD8651.png",
                        productText:
                            "Wonderful Pistachios, Sweet Chili Flavor, 14 Ounc"),
                  );
                },
              ),
            ),
            SizedBox(
              height: 41.h,
            ),
          ],
        ),
      ),
    );
  }
}
