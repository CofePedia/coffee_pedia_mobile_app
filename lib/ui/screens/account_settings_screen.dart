import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/update_profile/update_profile_cubit.dart';
import 'package:coffepedia/business_logic/update_profile/update_profile_state.dart';
import 'package:coffepedia/constants/colors.dart';
import 'package:coffepedia/data/models/me.dart';
import 'package:coffepedia/data/repository/update_profile_repository.dart';
import 'package:coffepedia/data/web_services/update_profile_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/shared/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key, required this.me}) : super(key: key);
  final MeModel me;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateProfileCubit>(
      create: (context) => UpdateProfileCubit(
        UpdateProfileRepository(
          UpdateProfileWebServices(),
        ),
      ),
      child: AccountSettings(
        me: this.me,
      ),
    );
  }
}

class AccountSettings extends StatefulWidget {
  final MeModel me;
  const AccountSettings({
    Key? key,
    required this.me,
  }) : super(key: key);

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  bool? visableEditable = false;
  bool? onPressed = false;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    firstname.dispose();
    lastname.dispose();
    password.dispose();
    super.dispose();
  }

  onUpdateProfileButtonPressed() {
    if (lastname.text.isEmpty) lastname.text = widget.me.data!.lastName!;
    if (firstname.text.isEmpty) firstname.text = widget.me.data!.firstName!;
    if (email.text.isEmpty) email.text = widget.me.data!.email!;

    imageFile != null
        ? BlocProvider.of<UpdateProfileCubit>(context).getUpdateProfile(
            firstname.text.trim(),
            lastname.text.trim(),
            email.text.trim(),
            password.text,
            File(imageFile!.path))
        : BlocProvider.of<UpdateProfileCubit>(context).getUpdateProfile(
            firstname.text.trim(),
            lastname.text.trim(),
            email.text.trim(),
            password.text,
            null);

    setState(() {
      onPressed = true;
    });
  }

  Future<bool> _onWillPop() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage(
            currentIndex: 2,
          );
        },
      ),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: onPressed == true
              ? BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                  builder: (context, state) {
                  if (state is UpdateProfileIsLoaded) {
                    widget.me.data!.email = email.text.trim();
                    widget.me.data!.lastName = lastname.text.trim();
                    widget.me.data!.firstName = firstname.text.trim();
                    widget.me.data!.name =
                        firstname.text.trim() + " " + lastname.text.trim();
                    visableEditable = false;
                    onPressed = false;
                    BotToast.showText(text: state.updateProfile!.data!.msg!);
                    return screenBody();
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
              : screenBody()),
    );
  }

  void onImageButtonPressed(
    ImageSource source, {
    BuildContext? context,
  }) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      imageFile = pickedFile;
      if (imageFile != null) {
        onUpdateProfileButtonPressed();
      }
    });
  }

  Widget screenBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 20.w, top: 60.h, right: 23.w, bottom: 35.5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage(
                            currentIndex: 2,
                          );
                        },
                      ),
                    );
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 24.w,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Account settings',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
              ],
            ),
          ),

          imageFile != null
              ? Container(
                  width: 50.0.w,
                  height: 50.0.h,
                  decoration: BoxDecoration(
                      image: kIsWeb
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageFile!.path),
                            )
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(imageFile!.path))),
                      shape: BoxShape.circle),
                )
              : widget.me.data!.avatar != null
                  ? Container(
                      width: 50.0.w,
                      height: 50.0.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.me.data!.avatar!)),
                          shape: BoxShape.circle))
                  : CircleAvatar(
                      backgroundColor: Color(0xffD8D8D8),
                      radius: 30.r,
                      child: SvgPicture.asset(
                        Assets.userPhote,
                      ),
                    ),
          SizedBox(
            height: 4.h,
          ),
          ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0.sp),
                backgroundColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () {
              onImageButtonPressed(ImageSource.gallery, context: context);
            },
            child: Text(
              'Add photo',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 12.sp),
            ),
          ),
          SizedBox(
            height: 10.5.h,
          ),
          Text(
            widget.me.data!.name!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 4.5.h,
          ),
          Text(
            widget.me.data!.email!,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            height: visableEditable! ? 305.h : 200.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal info',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      visableEditable!
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  visableEditable = false;
                                });
                              },
                              child: Text(
                                'Cancel',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  visableEditable = true;
                                  lastname.text = widget.me.data!.lastName!;
                                  firstname.text = widget.me.data!.firstName!;
                                  email.text = widget.me.data!.email!;
                                });
                              },
                              child: Text(
                                'Edit',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'First Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          color: Color(
                                            0xff8A8A8A,
                                          ),
                                        ),
                                  ),
                                  visableEditable!
                                      ? CustomTextFormField(
                                          width: 150.w,
                                          keyboardType: TextInputType.text,
                                          textEditingController: firstname,
                                          height: 35.h,
                                          hintText: 'First Name',
                                        )
                                      : Container(
                                          width: 150.w,
                                          child: Text(
                                            widget.me.data!.firstName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                        ),
                                ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Last Name',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        color: Color(
                                          0xff8A8A8A,
                                        ),
                                      ),
                                ),
                                visableEditable!
                                    ? CustomTextFormField(
                                        width: 150.w,
                                        keyboardType: TextInputType.text,
                                        textEditingController: lastname,
                                        height: 35.h,
                                        hintText: 'Last Name',
                                      )
                                    : Container(
                                        width: 150.w,
                                        child: Text(
                                          widget.me.data!.lastName!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                      ),
                              ],
                            )
                          ]),
                      SizedBox(height: 10.h),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Address',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    color: Color(
                                      0xff8A8A8A,
                                    ),
                                  ),
                            ),
                            visableEditable!
                                ? CustomTextFormField(
                                    width: 250.w,
                                    keyboardType: TextInputType.emailAddress,
                                    textEditingController: email,
                                    height: 35.h,
                                    hintText: 'email',
                                  )
                                : Container(
                                    width: 250.w,
                                    child: Text(
                                      widget.me.data!.email!,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ),
                          ]),
                      SizedBox(height: 10.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Color(
                                        0xff8A8A8A,
                                      ),
                                    ),
                          ),
                          visableEditable!
                              ? CustomTextFormField(
                                  width: 250.w,
                                  keyboardType: TextInputType.visiblePassword,
                                  textEditingController: password,
                                  height: 35.h,
                                  hintText: 'password',
                                )
                              : Container(
                                  width: 250.w,
                                  child: Text(
                                    '************',
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 10.w,
                      // ),
                      visableEditable!
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all(0.0.sp),
                                      backgroundColor:
                                          MaterialStateProperty.all(kYellow)),
                                  onPressed:
                                      // setState(() {
                                      onUpdateProfileButtonPressed
                                  // visableEditable = false;
                                  // });
                                  ,
                                  child: Text(
                                    'save',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          fontSize: 17.sp,
                                        ),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 144.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
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
              padding: EdgeInsets.only(top: 19.8.h, right: 15.w, left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping Address',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        'Manage Addresses',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 12.sp,
                            ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hesham Mahdy',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                      Container(
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Expanded(
                    child: Text(
                      'Walk Of Cairo 6 October City, Giza Governorate, Egypt 12588 - 6th of October City',
                      maxLines: 3,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),

          //payment method
          // Container(
          //   height: 92.h,
          //   margin: EdgeInsets.symmetric(horizontal: 15.w),
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(6.sp),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Color.fromRGBO(0, 0, 0, 0.12),
          //         offset: Offset(0, 2),
          //         blurRadius: 11.r,
          //       ),
          //     ],
          //   ),
          // child: Padding(
          //   padding: EdgeInsets.only(top: 19.8.h, right: 15.w, left: 15.w),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Payment Method',
          //             style: Theme.of(context).textTheme.caption,
          //           ),
          //           Text(
          //             'Add new card',
          //             style:
          //                 Theme.of(context).textTheme.headline6!.copyWith(
          //                       fontSize: 12.sp,
          //                     ),
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         height: 12.h,
          //       ),
          //       Row(
          //         children: [
          //           SvgPicture.asset(Assets.imagesVisaLogo),
          //           SizedBox(
          //             width: 22.78.w,
          //           ),
          //           Text(
          //             '**** **** **** 5089',
          //             style: Theme.of(context).textTheme.headline5,
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // ),
        ],
      ),
    );
  }
}
