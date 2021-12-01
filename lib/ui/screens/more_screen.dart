import 'package:coffepedia/ui/screens/about_screen.dart';
import 'package:coffepedia/ui/screens/blog_screen.dart';
import 'package:coffepedia/ui/screens/coffee_shops_screen.dart';
import 'package:coffepedia/ui/screens/recipes_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gridview_items.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 60.h, left: 16.w, right: 16.w, bottom: 27.h),
            child: Text(
              'More',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 18.sp,
                  ),
            ),
          ),
          Expanded(
            child: GridView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 13.w,
                childAspectRatio: 165.w / 110.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                GridviewItems(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CoffeeShopsScreen();
                        },
                      ),
                    );
                  },
                  icon: Icons.store,
                  title: 'Coffee shops',
                ),
                GridviewItems(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const BlogScreen();
                        },
                      ),
                    );
                  },
                  icon: Icons.eighteen_mp,
                  title: 'Blog',
                ),
                GridviewItems(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RecipesScreen();
                        },
                      ),
                    );
                  },
                  icon: Icons.eighteen_mp,
                  title: 'Recipes',
                ),
                GridviewItems(
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AboutScreen();
                        },
                      ),
                    );
                  },
                  icon: Icons.eighteen_mp,
                  title: 'About',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
