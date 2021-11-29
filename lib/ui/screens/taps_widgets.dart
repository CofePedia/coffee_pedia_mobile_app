import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TapsWidgets extends StatefulWidget {
  const TapsWidgets({Key? key}) : super(key: key);

  @override
  _TapsWidgetsState createState() => _TapsWidgetsState();
}

class _TapsWidgetsState extends State<TapsWidgets> {
  final List<String> topics = [
    'Van Cafes',
    'Americano',
    'Espresso',
    'Doppio',
  ];
  String topic = 'Van Cafes';
  int _currentColorTobicIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: topics.length,
      padding: EdgeInsets.only(
        left: 8.w,
      ),
      itemBuilder: (ctx, index) {
        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              topic = topics[index];
              _currentColorTobicIndex = index;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Container(
              height: 35.h,
              padding: EdgeInsets.all(11.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.5.r),
                color: _currentColorTobicIndex == index
                    ? Theme.of(context).primaryColor
                    : Color(0xffE9E7E7),
              ),
              child: Text(
                topics[index],
                style: _currentColorTobicIndex == index
                    ? Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 13.sp,
                        )
                    : Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.sp,
                        ),
              ),
            ),
          ),
        );
      },
    );
  }
}
