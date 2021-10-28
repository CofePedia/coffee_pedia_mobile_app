import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/widgets/category_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _expanded = false;
  List <bool> _isOpen = [false, true];
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
                padding: const EdgeInsets.all(15.0),
                child: ExpansionPanelList(
                  dividerColor: Colors.black,
                  elevation: 0,
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(brandName[0]),
                        );
                      },
                      body: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomOutlineButton(
                                title: 'Lavazza',
                                onPress: () {},
                                height: 35.h,
                                width: 90.w,
                                borderRadius: 17.5.sp,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(16, 124, 192, 0),
                                  ),
                                ],
                                borderColor: Theme.of(context).primaryColor,
                              ),
                              CustomOutlineButton(
                                title: 'Stumptown Coffee Roasters',
                                onPress: () {},
                                width: 224.w,
                                height: 35.h,
                                borderColor: Colors.grey,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.transparent,
                                  ),
                                ],
                                borderRadius: 17.5.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomOutlineButton(
                                title: 'Amazon Fresh',
                                onPress: () {},
                                height: 35.h,
                                width: 131.w,
                                borderRadius: 17.5.sp,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.transparent,
                                  ),
                                ],
                                borderColor: Colors.grey,
                              ),
                              CustomOutlineButton(
                                title: 'Starbucks',
                                onPress: () {},
                                height: 35.h,
                                width: 98.w,
                                borderRadius: 17.5.sp,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(16, 124, 192, 0),
                                  ),
                                ],
                                borderColor: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 80.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Container(
                            child: CustomOutlineButton(
                              title: 'SAN FRANCISCO BAY',
                              onPress: () {},
                              width: 186.w,
                              height: 35.h,
                              borderColor: Colors.grey,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent,
                                ),
                              ],
                              borderRadius: 17.5.sp,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                        ],
                      ),
                      isExpanded: false,
                    ),
                    ExpansionPanel(
                      headerBuilder: (context, isOpen) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Text(brandName[1]),
                        );
                      },
                      body: Text('Azzam'),
                      isExpanded: _isOpen[0],
                    ),
                    // ExpansionPanel(
                    //   headerBuilder: (context, isOpen) {
                    //     return Padding(
                    //       padding: EdgeInsets.symmetric(vertical: 30.h),
                    //       child: Text('Rating'),
                    //     );
                    //   },
                    //   body: Text('Azzam'),
                    //   isExpanded: _isOpen[0],
                    // ),
                    // ExpansionPanel(
                    //   headerBuilder: (context, isOpen) {
                    //     return Padding(
                    //       padding: EdgeInsets.symmetric(vertical: 30.h),
                    //       child: Text('Coffee Flavor'),
                    //     );
                    //   },
                    //   body: Text('Azzam'),
                    //   isExpanded: _isOpen[0],
                    // ),
                    // ExpansionPanel(
                    //   headerBuilder: (context, isOpen) {
                    //     return Padding(
                    //       padding: EdgeInsets.symmetric(vertical: 30.h),
                    //       child: Text('Coffee Roast'),
                    //     );
                    //   },
                    //   body: Text('Azzam'),
                    //   isExpanded: _isOpen[0],
                    // ),
                    // ExpansionPanel(
                    //   headerBuilder: (context, isOpen) {
                    //     return Padding(
                    //       padding: EdgeInsets.symmetric(vertical: 30.h),
                    //       child: Text('Coffee Region'),
                    //     );
                    //   },
                    //   body: Text('Azzam'),
                    //   isExpanded: _isOpen[0],
                    // ),
                  ],
                  expansionCallback: (i, isOpen) =>
                      setState(() => _isOpen[i] = !isOpen),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CategoryItems();
                        }));
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
                    // SizedBox(
                    //   height: 16.h,
                    // ),
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
