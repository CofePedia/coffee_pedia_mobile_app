import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RateContainer extends StatelessWidget {
  const RateContainer({
    required this.rate,
    Key? key,
  }) : super(key: key);
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
             Assets.iconsStarActive,
            ),
          Container(
              child: Text(
            rate.toString(),
           style: Theme.of(context).textTheme.bodyText2,
          )),
        ],
      ),
    );
  }
}
