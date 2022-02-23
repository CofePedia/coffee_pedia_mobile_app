import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class RangeFilterSlider extends StatefulWidget {
  final double min;
  final double max;
  final Map<String, String?> rangeMap;

  RangeFilterSlider(
      {required this.min, required this.max, required this.rangeMap, Key? key})
      : super(key: key);

  @override
  State<RangeFilterSlider> createState() => _RangeFilterSliderState();
}

class _RangeFilterSliderState extends State<RangeFilterSlider> {
  double? low;
  double? high;

  // @override
  // void initState() {
  //   low = widget.min;
  //   high = widget.max;
  //   super.initState();
  // }

  void addValueToRangeMap<K, V>(Map<K, V> rangeMap, K key, V value) {
    rangeMap.update(
      key,
      (list) => value,
      ifAbsent: () => value,
    );
    print("rangeMap $rangeMap");
  }

  @override
  Widget build(BuildContext context) {
    if (widget.rangeMap.isEmpty) {
      low = widget.min;
      high = widget.max;
    }
    return Column(
      children: [
        RangeSlider(
          activeColor: Theme.of(context).primaryColor,
          values: RangeValues(
            low!,
            high!,
          ),
          min: widget.min,
          max: widget.max,
          divisions: 5,
          labels: RangeLabels(
            low!.round().toString(),
            high!.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              low = values.start;
              high = values.end;
              addValueToRangeMap(widget.rangeMap, 'from_price', low.toString());
              addValueToRangeMap(widget.rangeMap, 'to_price', high.toString());
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${translator.translate("range_filter_slider.from")}: ${low!.round().toString()} ${translator.translate("range_filter_slider.egp")}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 13.sp),
            ),
            Text(
              '${translator.translate("range_filter_slider.to")}: ${high!.round().toString()} ${translator.translate("range_filter_slider.egp")}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 13.sp),
            ),
          ],
        ),
      ],
    );
  }
}
