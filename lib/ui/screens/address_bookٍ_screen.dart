import 'package:coffepedia/ui/screens/address_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  List<String> title = [
    'Hesham Mahdy',
    'Hesham Shorouk City',
  ];
  List<String> description = [
    'Walk Of Cairo 6 October City, Giza Governorate, Egypt 12588 - 6th of October City',
    'El-Shorouk City, km 37 Cairo - Suez Rd P.O Box. 51 El-Shorouk City - Behind City Hall, El-Shorouk, Cairo',
  ];
  int _selectedIndex = 0;
  String text = 'Hesham Mahdy';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 23.w, right: 23.w, top: 60.h, bottom: 18.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.chevron_left,
                      size: 24.w,
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Text(
                    'Address Book',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              height: 280.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: title.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Container(
                    height: 111.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      boxShadow: [
                        BoxShadow(
                          color: _selectedIndex == index
                              ? Color.fromRGBO(16, 124, 192, 0.41)
                              : Colors.transparent,
                          blurRadius: 7.r,
                        ),
                      ],
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          text = title[index];
                          _selectedIndex = index;
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero,
                        ),
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: _selectedIndex == index
                                ? Theme.of(context).primaryColor
                                : Color(0xffE3E3E3),
                          ),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                      ),
                      child: RadioListTile(
                        activeColor: Theme.of(context).primaryColor,
                        groupValue: _selectedIndex,
                        value: index,
                        onChanged: (dynamic value) {
                          setState(() {
                            _selectedIndex = value;
                          });
                        },
                        contentPadding: EdgeInsets.all(15),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    fontSize: 14.sp,
                                  ),
                            ),
                            title[index] == title[0]
                                ? Container(
                                    height: 17.h,
                                    width: 67.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(
                                        0xffFFD008,
                                      ),
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
                                : InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Theme.of(context).primaryColor,
                                      size: 30.h,
                                    ),
                                  ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                              description[index],
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  enableDrag: false,
                  isDismissible: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                    ),
                  ),
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => AddAddressSheetProvider(),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.control_point,
                      color: Theme.of(context).primaryColor,
                      size: 17.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Add New Address',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
