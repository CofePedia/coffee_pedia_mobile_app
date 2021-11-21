import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/success_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentInfoScreen extends StatefulWidget {
  const PaymentInfoScreen({Key? key}) : super(key: key);

  @override
  State<PaymentInfoScreen> createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  List<String> title = [
    'Cash on Delivery',
    'Bank Card',
    'Fawry',
    'Premium Card'
  ];

  int _selectedIndex = 0;
  bool _selected = false;
  String text = 'Hesham Mahdy';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 225.h,
        child: Column(
          children: [
            Divider(
              color: Color(0xff979797),
              thickness: 0.7.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 23.h, right: 15.w, left: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wallet Balance',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    'EGP199',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selected = !_selected;
                      });
                    },
                    child: Icon(
                      _selected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: Color(0xff27DC4E),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    'Use my wallet balance in this order',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            Container(
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
                title: 'Pay Now',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SuccessScreen();
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
          ],
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
                  'Payment info',
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
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Container(
                    height: 27.h,
                    width: 27.w,
                    alignment: Alignment.center,
                    child: Text(
                      '2',
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
                  style: Theme.of(context).textTheme.headline6,
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
              height: 350.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 12.h),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: title.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                  child: Container(
                    //  height: 55.h,
                    width: 343.w,
                    alignment: Alignment.center,
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
                        alignment: Alignment.center,
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
                        contentPadding: EdgeInsets.zero,
                        secondary:
                            _selectedIndex == index && _selectedIndex == 1
                                ? SizedBox.shrink()
                                : Container(
                                    child: SvgPicture.asset(
                                      Assets.fawryImage,
                                      height: 25.h,
                                      width: 25.w,
                                    ),
                                  ),
                        onChanged: (dynamic value) {
                          setState(() {
                            _selectedIndex = value;
                          });
                        },
                        title: Padding(
                          padding:
                              _selectedIndex == index && _selectedIndex == 1
                                  ? EdgeInsets.only(top: 17.h)
                                  : EdgeInsets.only(top: 0.h),
                          child: Text(
                            title[index],
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 14.sp,
                                    ),
                          ),
                        ),
                        subtitle: _selectedIndex == index && _selectedIndex == 1
                            ? Form(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 22.h,
                                    ),
                                    Text(
                                      'Card Holder Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(fontSize: 12.sp),
                                    ),
                                    SizedBox(
                                      height: 9.h,
                                    ),
                                    CustomTextFormField(
                                      hintText: 'Card Holder Name',
                                      keyboardType: TextInputType.text,
                                      width: 311.w,
                                      suffix: SizedBox.shrink(),
                                      height: 40.h,
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      'Card Number',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(fontSize: 12.sp),
                                    ),
                                    SizedBox(
                                      height: 9.h,
                                    ),
                                    CustomTextFormField(
                                      hintText: 'Card Number',
                                      keyboardType: TextInputType.number,
                                      width: 311.w,
                                      height: 40.h,
                                      suffix: Container(
                                        width: 115.w,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 28.h,
                                              width: 51.w,
                                              padding: EdgeInsets.all(3.h),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffF3F1F1),
                                                  width: 1.w,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                              ),
                                              child: SvgPicture.asset(
                                                Assets.imagesMastercardLogo,
                                                // height: 24.h,
                                                // width: 50.w,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 9.w,
                                            ),
                                            Container(
                                              height: 28.h,
                                              width: 51.w,
                                              padding: EdgeInsets.all(3.h),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color(0xffF3F1F1),
                                                  width: 1.w,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                              ),
                                              child: SvgPicture.asset(
                                                Assets.imagesVisaLogo,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Card Number',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(fontSize: 12.sp),
                                        ),
                                        Text(
                                          'CVV',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(fontSize: 12.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 9.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: CustomTextFormField(
                                            hintText: 'MM',
                                            keyboardType: TextInputType.number,
                                            width: 10.w,
                                            height: 40.h,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: CustomTextFormField(
                                            hintText: 'YY',
                                            keyboardType: TextInputType.number,
                                            width: 10.w,
                                            height: 40.h,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: CustomTextFormField(
                                            hintText: 'CVV',
                                            keyboardType: TextInputType.number,
                                            width: 20.w,
                                            height: 40.h,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16.w,
                                    ),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
