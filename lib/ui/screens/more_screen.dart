import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/about_screen.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/vendor_registration_screen.dart';
import 'package:coffepedia/ui/widgets/more_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);

  final List<String> title = [
    'Coffee shops',
    'Blog',
    'Recipes',
    "About",
  ];
  final List<String> subTitle = [
    'Explore nearby Coffee shops',
    'Share your love',
    'Prepare it by yourself',
    ""
  ];

  final List<String> backgroundImage = [
    Assets.coffeeShopImage,
    Assets.blogImage,
    Assets.recipesImage,
    Assets.aboutImage,
  ];

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h, bottom: 37.h),
                child: Text(
                  translator.translate("more_screen.more"),
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
              ),
              MoreItems(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AboutCofepediaScreen();
                      },
                    ),
                  );
                },
                title: translator.translate("more_screen.about"),
                image: Assets.aboutImage,
                isAbout: true,
              ),
              MoreItems(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return VendorRegistrationProvider();
                      },
                    ),
                  );
                },
                title: translator.translate("more_screen.become_a_partner"),
                image: Assets.becomeAPartner,
                isAbout: true,
              ),
              MoreItems(
                onPress: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const CoffeeShopsScreen();
                  //     },
                  //   ),
                  // );
                },
                subTitle: translator
                    .translate("more_screen.Explore nearby Coffee shops"),
                title: translator.translate("more_screen.coffee_shops"),
                image: Assets.coffeeShopImage,
              ),
              MoreItems(
                onPress: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const BlogScreen();
                  //     },
                  //   ),
                  // );
                },
                subTitle: translator.translate("more_screen.Share your love"),
                title: translator.translate("more_screen.blog"),
                image: Assets.blogImage,
              ),
              MoreItems(
                onPress: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const RecipesScreen();
                  //     },
                  //   ),
                  // );
                },
                subTitle:
                    translator.translate("more_screen.Prepare it by yourself"),
                title: translator.translate("more_screen.recipes"),
                image: Assets.recipesImage,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
