import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class RatingBarComponent extends StatelessWidget {
  final double rate;
  const RatingBarComponent({required this.rate, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemBuilder: (context, index) => SvgPicture.asset(
        'assets/icons/star_active.svg',
      ),
      itemCount: 5, itemPadding: EdgeInsets.zero,
      unratedColor: Colors.grey.shade400,
      itemSize: 15,
      //itemSize: 50.0,
      direction: Axis.horizontal,
    );
  }
}
