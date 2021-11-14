import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 43.h,
        width: 345.w,
        alignment: Alignment.center,
        child:
                TextField(
            decoration: InputDecoration(
                  hintText: 'Search Coffepedia',
                  prefixIcon: SvgPicture.asset(
                       Assets.iconsSearch,
                       fit: BoxFit.none,
                      ),
                  hintStyle: Theme.of(context).textTheme.headline2!.copyWith(
                         color:Colors.black.withOpacity(0.5)
                        ),
                ),
                ),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0.r),
                border: Border.all(color: Colors.black12),
                color: Colors.white
                ),
                   );
  }
}
