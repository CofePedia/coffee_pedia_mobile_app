import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class SwitchLanguageBottomSheet extends StatefulWidget {
  const SwitchLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<SwitchLanguageBottomSheet> createState() =>
      _SwitchLanguageBottomSheetState();
}

class _SwitchLanguageBottomSheetState extends State<SwitchLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Container(
        height: 216.h,
        width: 375.w,
        child: Padding(
          padding: EdgeInsets.only(top: 31.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.radio_button_checked,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    'English',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.radio_button_unchecked,
                      color: Color(0xffE3E3E3),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    'العربية',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
              Expanded(
                child: CustomButton(
                  onPress: () {},
                  title: translator.translate("profile_screen.save"),
                  height: 50.h,
                  width: 345.w,
                  imageWidth: 0,
                  imageHeight: 0,
                  buttonColor: Theme.of(context).primaryColor,
                  borderRadius: 25.sp,
                  imageColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
