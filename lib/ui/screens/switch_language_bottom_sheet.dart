import 'package:coffepedia/main.dart';
import 'package:coffepedia/services/restart.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchLanguageBottomSheet extends StatefulWidget {
  const SwitchLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<SwitchLanguageBottomSheet> createState() =>
      _SwitchLanguageBottomSheetState();
}

class _SwitchLanguageBottomSheetState extends State<SwitchLanguageBottomSheet> {
  List<String> languageType = ['العربية', 'English'];
  int currentIndex = 0;
  int? id;
  @override
  void initState() {
    id = translator.currentLanguage == "ar" ? 1 : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Container(
        height: 180.h,
        width: 375.w,
        child: Padding(
          padding: EdgeInsets.only(top: 31.h, left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile(
                activeColor: Theme.of(context).primaryColor,
                groupValue: id,
                value: 0,
                title: Text(
                  "English",
                  style: TextStyle(
                    fontFamily: 'dinMedium',
                    color: Color.fromRGBO(5, 5, 5, 1),
                    fontSize: 16,
                    height: 2,
                  ),
                ),
                onChanged: (dynamic newValue) async {
                  setState(() {
                    id = newValue;
                  });
                  await translator.changeLanguage();
                  RestartWidget.restartApp(this.context);
                },
              ),
              RadioListTile(
                activeColor: Theme.of(context).primaryColor,
                groupValue: id,
                value: 1,
                title: Text(
                  "العربية",
                  style: TextStyle(
                    fontFamily: 'dinMedium',
                    color: Color.fromRGBO(5, 5, 5, 1),
                    fontSize: 16,
                    height: 2,
                  ),
                ),
                onChanged: (dynamic newValue) async {
                  setState(() {
                    id = newValue;
                  });
                  await translator.changeLanguage();
                  RestartWidget.restartApp(this.context);
                },
              ),
            ],
          ),
          // child: Column(
          //   children: [
          //     ListView.builder(
          //       shrinkWrap: true,
          //       physics: NeverScrollableScrollPhysics(),
          //       itemCount: languageType.length,
          //       padding: EdgeInsets.zero,
          //       itemBuilder: (context, index) => Padding(
          //         padding: EdgeInsets.symmetric(vertical: 8.h),
          //         child: InkWell(
          //           onTap: () {
          //             setState(() {
          //               currentIndex = index;
          //             });
          //           },
          //           child: Row(
          //             children: [
          //               Icon(
          //                 currentIndex == index
          //                     ? Icons.radio_button_checked
          //                     : Icons.radio_button_unchecked,
          //                 color: currentIndex == index
          //                     ? Theme.of(context).primaryColor
          //                     : Color(0xffE3E3E3),
          //               ),
          //               SizedBox(
          //                 width: 16.w,
          //               ),
          //               Text(
          //                 languageType[index],
          //                 style:
          //                     Theme.of(context).textTheme.bodyText1!.copyWith(
          //                           fontSize: 14.sp,
          //                         ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: CustomButton(
          //         onPress: () async {
          //           Navigator.pop(context);
          //           translator.changeLanguage();
          //
          //           RestartWidget.restartApp(context);
          //         },
          //         title: translator.translate("profile_screen.save"),
          //         height: 50.h,
          //         width: 345.w,
          //         imageWidth: 0,
          //         imageHeight: 0,
          //         buttonColor: Theme.of(context).primaryColor,
          //         borderRadius: 25.sp,
          //         imageColor: Colors.transparent,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
