import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    required this.priceAfter,
    required this.priceBefore,
    Key? key,
  }) : super(key: key);
  final String priceAfter, priceBefore;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              priceBefore,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black.withOpacity(0.5),
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
          ),
          Text(
            priceAfter,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 16.sp),
          )
        ],
      ),
    );
  }
}
