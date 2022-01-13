import 'package:coffepedia/constants/colors.dart';
import 'package:coffepedia/data/models/my_addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCard extends StatelessWidget {
  AddressCard({
    // this.primary,
    this.menu,
    required this.address,
    Key? key,
  }) : super(key: key);
  // bool? primary = false;
  late bool? menu;
  final List<MyAddressesData> address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: ListView.builder(
          itemCount: address.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Container(
                height: 100.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      offset: Offset(0, 2),
                      blurRadius: 11.r,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 19.8.h, right: 15.w, left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              address[index].street!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ),
                          // //primary
                          address[index].primary == 0
                              ? Container(
                                  height: 17.h,
                                  width: 67.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: kYellow,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        12.5.r,
                                      ),
                                      bottomRight: Radius.circular(
                                        12.5.r,
                                      ),
                                      bottomLeft: Radius.circular(
                                        12.5.r,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Primary',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 10.sp),
                                  ),
                                )
                              : menu == null
                                  ? new PopupMenuButton<String>(
                                      itemBuilder: (BuildContext context) {
                                        return myMenuItems
                                            .map((String choice) {
                                          return PopupMenuItem<String>(
                                            child: Text(choice),
                                            value: choice,
                                          );
                                        }).toList();
                                      },
                                      onSelected: onSelectedFunc,
                                      child: Icon(
                                        Icons.more_vert,
                                        color: kBlue,
                                        size: 25.h,
                                      ),
                                    )
                                  : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Expanded(
                        child: Text(
                          address[index].street!,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }

  var myMenuItems = <String>[
    'asPrimary',
    'Delete',
  ];

  void onSelectedFunc(item) {
    switch (item) {
      case 'asPrimary':
        print('asPrimary clicked');
        break;
      case 'Delete':
        print('Delete clicked');
        break;
    }
  }
}
