import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    required this.price_after,
    required this.price_before,
    Key? key,
  }) : super(key: key);
 final String price_after, price_before;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              price_before,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(color:Colors.black.withOpacity(0.5) ,  decoration: TextDecoration.lineThrough,),
            ),
          ),
          Text(
            price_after,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
