import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/widgets/filters_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersScreen extends StatefulWidget {
  final List<CategoryProductsDataFilters?>? productFilters;
  const FiltersScreen({required this.productFilters, Key? key})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<bool>? _isOpen;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  void initState() {
    _isOpen = List.filled(widget.productFilters!.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 24.h,
                  left: 24.w,
                  right: 24.w,
                ),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text(
                    'Close',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xff241F20),
                          fontSize: 14.sp,
                        ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: ExpansionPanelList(
                  dividerColor: Color(0xff979797),
                  elevation: 0,
                  expandedHeaderPadding: EdgeInsets.zero,
                  children: List.generate(
                    widget.productFilters!.length,
                    (filterIndex) => ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(
                            widget.productFilters![filterIndex]!.name!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      },
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        child:
                            widget.productFilters![filterIndex]!.type == 'multi'
                                ? Wrap(
                                    spacing: 4.w,
                                    children: List.generate(
                                      widget.productFilters![filterIndex]!
                                          .optionsMulti!.length,
                                      (multiIndex) => FiltersButtons(
                                        title: widget
                                            .productFilters![filterIndex]!
                                            .optionsMulti![multiIndex]
                                            .name!,
                                      ),
                                    ),
                                  )
                                : widget.productFilters![filterIndex]!.type ==
                                        'range'
                                    ? Column(
                                        children: [
                                          RangeSlider(
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            values: _currentRangeValues,
                                            max: widget
                                                .productFilters![filterIndex]!
                                                .optionsRange!
                                                .max!
                                                .toDouble(),
                                            min: widget
                                                .productFilters![filterIndex]!
                                                .optionsRange!
                                                .min!
                                                .toDouble(),
                                            divisions: 5,
                                            // labels: RangeLabels(
                                            //   _currentRangeValues.start
                                            //       .round()
                                            //       .toString(),
                                            //   _currentRangeValues.end
                                            //       .round()
                                            //       .toString(),
                                            // ),
                                            onChanged: (RangeValues values) {
                                              setState(() {
                                                _currentRangeValues = values;
                                              });
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Lower Price: ${_currentRangeValues.start.round().toString()}',
                                              ),
                                              Text(
                                                'Upper Price: ${_currentRangeValues.end.round().toString()}',
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                      ),
                      isExpanded: _isOpen![filterIndex],
                    ),
                  ),
                  expansionCallback: (i, isOpen) => setState(
                    () => _isOpen![i] = !isOpen,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
                height: 132.h,
                width: 375.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.18),
                      blurRadius: 2.r,
                    ),
                  ],
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.r),
                    topRight: Radius.circular(22.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      onPress: () {},
                      title: 'Show results',
                      height: 50.h,
                      width: 345.w,
                      imageWidth: 0,
                      imageHeight: 0,
                      buttonColor: Theme.of(context).primaryColor,
                      borderRadius: 25.r,
                      imageColor: Colors.transparent,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Clear all',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Color(0xff007CC6),
                            ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
