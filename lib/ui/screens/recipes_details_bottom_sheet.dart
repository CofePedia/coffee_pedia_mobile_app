import 'package:card_swiper/card_swiper.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home/card_featured_products.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../checkout_popup.dart';
import 'chechbox_widget.dart';

class RecipesDetailsBottomSheet extends StatefulWidget {
  const RecipesDetailsBottomSheet({Key? key}) : super(key: key);

  @override
  State<RecipesDetailsBottomSheet> createState() =>
      _RecipesDetailsBottomSheetState();
}

class _RecipesDetailsBottomSheetState extends State<RecipesDetailsBottomSheet> {
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
          controller: controller,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 24.h,
                left: 24.w,
                right: 24.w,
              ),
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            // font change
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'French Cafe au Lait',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Color(0xff181818),
                    ),
              ),
            ),
            SizedBox(
              height: 17.6.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'This Mocha au Lait mix makes a great holiday gift, presented in a decorative holiday container or mug! Just make sure you remember to include the directions on a gift tag!',
                style: Theme.of(context).textTheme.headline4,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                height: 234.h,
                width: MediaQuery.of(context).size.width,
                child: Swiper(
                  itemCount: 5,
                  autoplay: true,
                  outer: true,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Color(0xffBDBDBD),
                      activeColor: Theme.of(context).primaryColor,
                      activeSize: 6.h,
                      size: 6.h,
                      space: 2.w,
                    ),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                      child: Image.asset(
                        Assets.coffee,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Recipe overview',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18.h,
                  childAspectRatio: 130.w / 30.h,
                ),
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preperation',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Color(
                              0xff8A8A8A,
                            ),
                          ),
                    ),
                    Text(
                      '10 mins',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 5.h,
              color: Color(0xffEFEFEF),
            ),
            SizedBox(
              height: 19.8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
                  child: CheckboxWidget(title: '1 ½ cups dry milk powder'),
                ),
              ),
            ),

            Container(
              margin: EdgeInsetsDirectional.only(end: 190.w, top: 16.h),
              child: CustomButton(
                onPress: () {
                  showModalBottomSheet(
                    enableDrag: false,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                    ),
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => CheckoutPopUp(),
                  );
                },
                width: 170.w,
                height: 50.h,
                assetName: Assets.iconsShoppingBasket,
                borderRadius: 25.r,
                title: 'Add to basket',
                buttonColor: Theme.of(context).primaryColor,
                imageColor: Theme.of(context).accentColor,
                imageHeight: 18.h,
                imageWidth: 24.w,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 5.h,
              color: Color(0xffEFEFEF),
            ),
            SizedBox(
              height: 19.8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Directions',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              child: ListView.builder(
                itemCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 6.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'STEP 1',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        'In a medium bowl, combine milk powder, instant coffee, brown sugar and mini chocolate chips. Mix well and store in an airtight container.',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 9.h,
            ),
            Divider(
              thickness: 5.h,
              color: Color(0xffEFEFEF),
            ),
            SizedBox(
              height: 19.8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Products in this video',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 286.h,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 11.w),
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
          ],
        ),
      ),
    );
    ;
  }
}
