import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingBarComponent  extends StatelessWidget {
  const RatingBarComponent ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => SvgPicture.asset('assets/icons/star_active.svg'),
          onRatingUpdate: (rating) {
            print('rating_bar: $rating');
          },
        ),
      ),
    );
  }
}
