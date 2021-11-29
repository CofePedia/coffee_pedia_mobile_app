import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/widgets/filters_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? _isOpen = false;

  final List<String> componentsName = [
    'Brand',
    'Price',
    'Rating',
    'Coffee Flavor',
    'Coffee Roast',
    'Coffee Region',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.h,
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
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(
                            componentsName[0],
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      },
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          spacing: 4.w,
                          children: [
                            FiltersButtons(
                              title: 'Lavazza',
                            ),
                            FiltersButtons(
                              title: 'Stumptown Coffee Roasters',
                            ),
                            FiltersButtons(
                              title: 'Amazon Fresh',
                            ),
                            FiltersButtons(
                              title: 'Starbucks',
                            ),
                            FiltersButtons(
                              title: 'SAN FRANCISCO BAY',
                            ),
                          ],
                        ),
                      ),
                      isExpanded: _isOpen!,
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(
                            componentsName[1],
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(
                            componentsName[2],
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(
                            componentsName[3],
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(
                            componentsName[4],
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(
                            componentsName[5],
                            style: Theme.of(context).textTheme.caption,
                          ),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                  ],
                  expansionCallback: (i, isOpen) =>
                      setState(() => _isOpen = !isOpen),
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
