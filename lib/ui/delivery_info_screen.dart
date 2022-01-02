import 'package:coffepedia/ui/screens/address_bottom_sheet.dart';
import 'package:coffepedia/ui/screens/payment_info_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryInfoScreen extends StatefulWidget {
  const DeliveryInfoScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryInfoScreen> createState() => _DeliveryInfoScreenState();
}

class _DeliveryInfoScreenState extends State<DeliveryInfoScreen> {
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: 107.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.04),
              blurRadius: 2.r,
            )
          ],
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        child: CustomButton(
          title: 'Continue',
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PaymentInfoScreen();
                },
              ),
            );
          },
          width: 345.w,
          height: 50.h,
          borderRadius: 25.r,
          buttonColor: Theme.of(context).primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    size: 24.w,
                  ),
                  color: Color(0xff000000),
                ),
                Text(
                  'Delivery info',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 33.h, bottom: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 27.h,
                    width: 27.w,
                    alignment: Alignment.center,
                    child: Text(
                      '1',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(
                        25.r,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 58.w,
                    child: Divider(
                      thickness: 2.h,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  SizedBox(
                    width: 58.w,
                    child: Divider(
                      thickness: 2.h,
                      color: Color(0xff9D9D9D),
                    ),
                  ),
                  Container(
                    height: 27.h,
                    width: 27.w,
                    alignment: Alignment.center,
                    child: Text(
                      '2',
                      style: Theme.of(context).textTheme.overline,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff9D9D9D),
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(
                        25.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Delivery Info',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  width: 63.w,
                ),
                Text(
                  'Payment Info',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Color(0xff9D9D9D),
                      ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 27.h),
              child: Text(
                'From Address Book',
                style: Theme.of(context).textTheme.caption,
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
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
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
                        title: Text(
                          title[index],
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: 14.sp,
                                  ),
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
