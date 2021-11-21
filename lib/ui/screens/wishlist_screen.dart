import 'package:coffepedia/generated/assets.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 23.w, top: 60.h, right: 23.w, bottom: 35.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.chevron_left,
                      size: 24.w,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'My wishlist',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 716.5.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 15.5.w,
                  childAspectRatio: 164.5.w / 293.h,
                  // mainAxisExtent: 5,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => Stack(
                  fit: StackFit.loose,
                  children: [
                    Positioned(
                      top: 13.h,
                      child: Container(
                        height: 280.h,
                        width: 164.5.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(12, 0, 0, 0),
                              blurRadius: 12.r,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            11.r,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0.1.w,
                      child: Image.asset(
                        Assets.imagesPack,
                        width: 82.6.w,
                        height: 118.h,
                      ),
                    ),
                    Positioned(
                      top: 29.h,
                      left: 12.w,
                      child: Row(
                        children: [
                          SvgPicture.asset(Assets.iconsStarActive),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '4.5',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 171.h,
                      left: 12.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 135.w,
                            height: 54.h,
                            child: Text(
                              'AmazonFresh Just Bright Ground Coffee, Light Roast',
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Text(
                            'EGP 340',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 13.5.w,
                      bottom: 16.h,
                      child: Container(
                        height: 38.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(25.r),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.12),
                              offset: Offset(0, 2),
                              blurRadius: 11.sp,
                            )
                          ],
                        ),
                        child: FavoriteButton(
                          isFavorite: true,
                          iconSize: 38.h,
                          iconColor: Color(0xffE02020),
                          valueChanged: (_isFavorite) {
                            print('Is Favorite $_isFavorite)');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
