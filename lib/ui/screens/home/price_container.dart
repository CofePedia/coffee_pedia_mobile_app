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
        children: [
          Container(
            child: Text(
              price_before,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            price_after,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.blue,
            ),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
