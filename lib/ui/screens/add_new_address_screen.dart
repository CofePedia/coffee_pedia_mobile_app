import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/shared/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 649.h,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Text(
                  'New Address',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hintText: 'First Name',
                          width: 168.w,
                          suffix: SizedBox.shrink(),
                          keyboardType: TextInputType.name,
                          height: 40.h,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hintText: 'Last Name',
                          width: 168.w,
                          suffix: SizedBox.shrink(),
                          keyboardType: TextInputType.name,
                          height: 40.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 12.h),
                child: Text(
                  'Email',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 12.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h),
                child: CustomTextFormField(
                  hintText: 'Email Address',
                  width: 345.w,
                  suffix: SizedBox.shrink(),
                  keyboardType: TextInputType.emailAddress,
                  height: 40.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 12.h),
                child: Text(
                  'Phone',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 12.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h),
                child: CustomTextFormField(
                  hintText: 'Phone Number',
                  width: 345.w,
                  suffix: SizedBox.shrink(),
                  keyboardType: TextInputType.phone,
                  height: 40.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Governorate',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hintText: 'Governorate',
                          width: 168.w,
                          suffix: SizedBox.shrink(),
                          keyboardType: TextInputType.text,
                          height: 40.h,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Area',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hintText: 'Area',
                          width: 168.w,
                          suffix: SizedBox.shrink(),
                          keyboardType: TextInputType.text,
                          height: 40.h,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hintText: 'City',
                          width: 168.w,
                          suffix: SizedBox.shrink(),
                          keyboardType: TextInputType.text,
                          height: 40.h,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Street',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hintText: 'Street',
                          width: 168.w,
                          suffix: SizedBox.shrink(),
                          keyboardType: TextInputType.text,
                          height: 40.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 12.h),
                child: Text(
                  'Address Details',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 12.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h),
                child: CustomTextFormField(
                  hintText: 'Type here …',
                  width: 345.w,
                  suffix: SizedBox.shrink(),
                  keyboardType: TextInputType.multiline,
                  height: 93.h,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 107.h,
              width: 375.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.18),
                    blurRadius: 2.sp,
                  ),
                ],
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.h),
                  topRight: Radius.circular(22.h),
                ),
              ),
              child: CustomButton(
                onPress: () {},
                title: 'Add Address',
                height: 50.h,
                width: 345.w,
                imageWidth: 0,
                imageHeight: 0,
                buttonColor: Theme.of(context).primaryColor,
                borderRadius: 25.sp,
                imageColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
