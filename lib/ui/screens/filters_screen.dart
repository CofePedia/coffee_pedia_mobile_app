import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/widgets/category_items.dart';
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
  final List<String> brandName = [
    'Lavazza',
    'Stumptown Coffee Roasters',
    'Amazon Fresh',
    'Starbucks',
    'SAN FRANCISCO BAY',
  ];
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
      height: 640.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.h),
          topRight: Radius.circular(25.h),
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 30.h,
                  left: 24.w,
                  right: 24.w,
                ),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text(
                    'Close',
                    style: TextStyle(
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
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(componentsName[0]),
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
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(componentsName[1]),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(componentsName[2]),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(componentsName[3]),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(componentsName[4]),
                        );
                      },
                      body: Text(''),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(componentsName[5]),
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
                      blurRadius: 6.sp,
                    ),
                  ],
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.h),
                    topRight: Radius.circular(22.h),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CategoryItems();
                            },
                          ),
                        );
                      },
                      title: 'Show results',
                      height: 50.h,
                      width: 345.w,
                      imageWidth: 0,
                      imageHeight: 0,
                      borderRadius: 25.sp,
                      buttonColor: Color(0xff107CC0),
                      imageColor: Colors.transparent,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Clear all',
                        style: TextStyle(
                          fontSize: 14.sp,
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
// Container(
//   height: 461.h,
//   padding: EdgeInsets.symmetric(horizontal: 15.w),
//   child: ListView.builder(
//     itemCount: componentsName.length,
//     itemBuilder: (context, i) => Column(
//
//       children: [
//         SizedBox(
//           height: 21.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               componentsName[i],
//               style: TextStyle(
//                 color: Color(0xff231F20),
//                 fontSize: 16.sp,
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 setState(
//                   () {
//                     _expanded = !_expanded;
//                   },
//                 );
//               },
//               child: Icon(
//                 _expanded ? Icons.expand_less : Icons.expand_more,
//                 size: 19.h,
//               ),
//             )
//           ],
//         ),
//         SizedBox(
//           height: 26.h,
//         ),
//         Divider(
//           height: 1.h,
//           color: Color(0xff979797),
//         ),
//       ],
//     ),
//   ),
// ),
