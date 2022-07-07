import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/vendor_registration/vendor_registration_cubit.dart';
import 'package:coffepedia/data/repository/vendor_register_repository.dart';
import 'package:coffepedia/data/web_services/vendor_register_web_services.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import '../../main.dart';
import '../shared/custom_button.dart';
import '../shared/custom_input.dart';

class VendorRegistrationProvider extends StatelessWidget {
  const VendorRegistrationProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VendorRegistrationCubit(
        VendorRegisterRepository(
          VendorRegisterWebServices(),
        ),
      ),
      child: VendorRegistrationScreen(),
    );
  }
}

class VendorRegistrationScreen extends StatefulWidget {
  VendorRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<VendorRegistrationScreen> createState() =>
      _VendorRegistrationScreenState();
}

class _VendorRegistrationScreenState extends State<VendorRegistrationScreen> {
  final TextEditingController _firstName = TextEditingController();

  final TextEditingController _lastName = TextEditingController();

  final TextEditingController _phoneNumber = TextEditingController();

  final TextEditingController _brandName = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _website = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _passwordConfirmation = TextEditingController();

  final TextEditingController _arDescription = TextEditingController();

  final TextEditingController _enDescription = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<PlatformFile>? contract;
  List<PlatformFile>? taxCard;
  List<PlatformFile>? commercialRegister;

  bool commercialRegisterIsPressed = false;
  bool taxCardIsPressed = false;
  bool contractIsPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160.h,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.becomeAVendor),
                    fit: BoxFit.fill,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 25.h,
                  left: 24.w,
                  right: 24.w,
                  bottom: 20.h,
                ),
                child: Text(
                  translator
                      .translate("vendor_registration_screen.your_details"),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.first_name"),
                    hint: translator
                        .translate("vendor_registration_screen.first_name"),
                    textEditingController: _firstName,
                    textInputType: TextInputType.text,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty) {
                        return translator.translate(
                            "login_registration_screen.Invalid_name");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.last_name"),
                    hint: translator
                        .translate("vendor_registration_screen.last_name"),
                    textEditingController: _lastName,
                    textInputType: TextInputType.text,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty) {
                        return translator.translate(
                            "login_registration_screen.Invalid_name");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.phone_number"),
                    hint: translator
                        .translate("vendor_registration_screen.phone_number"),
                    textEditingController: _phoneNumber,
                    textInputType: TextInputType.phone,
                    padding: false,
                    max: true,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty ||
                          value!.length < 11) {
                        return translator.translate(
                            "login_registration_screen.Invalid_number");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.brand_name"),
                    hint: translator
                        .translate("vendor_registration_screen.brand_name"),
                    textEditingController: _brandName,
                    textInputType: TextInputType.text,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty ||
                          value != _brandName.text) {
                        return translator
                            .translate("vendor_registration_screen.required");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.email"),
                    hint: translator
                        .translate("vendor_registration_screen.email"),
                    textEditingController: _email,
                    textInputType: TextInputType.emailAddress,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty ||
                          !value!.contains('@') ||
                          !value.contains('.')) {
                        return translator.translate(
                            "login_registration_screen.Invalid_email");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.password"),
                    hint: translator
                        .translate("vendor_registration_screen.password"),
                    textEditingController: _password,
                    textInputType: TextInputType.text,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty ||
                          value!.length < 8) {
                        return translator.translate(
                            "login_registration_screen.Password_is_too_short");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator.translate(
                        "vendor_registration_screen.password_confirmation"),
                    hint: translator.translate(
                        "vendor_registration_screen.password_confirmation"),
                    textEditingController: _passwordConfirmation,
                    textInputType: TextInputType.text,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty ||
                          value != _password.text) {
                        return translator.translate(
                            "login_registration_screen.Passwords_do_not_match");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.ar_description"),
                    hint: translator
                        .translate("vendor_registration_screen.ar_description"),
                    textEditingController: _arDescription,
                    textInputType: TextInputType.multiline,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty ||
                          value != _arDescription.text) {
                        return translator
                            .translate("vendor_registration_screen.required");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.en_description"),
                    hint: translator
                        .translate("vendor_registration_screen.en_description"),
                    textEditingController: _enDescription,
                    textInputType: TextInputType.multiline,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty ||
                          value != _enDescription.text) {
                        return translator
                            .translate("vendor_registration_screen.required");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomInput(
                    title: translator
                        .translate("vendor_registration_screen.website"),
                    hint: translator
                        .translate("vendor_registration_screen.website"),
                    textEditingController: _website,
                    textInputType: TextInputType.text,
                    padding: false,
                    icon: false,
                    validator: (value) {
                      if (value != null && value.trim().isEmpty ||
                          value != _website.text) {
                        return translator
                            .translate("vendor_registration_screen.required");
                      }
                      return null;
                    },
                    onChanged: (value) {}),
              ),
              InkWell(
                onTap: () async {
                  commercialRegister = (await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'pdf', 'doc'],
                  ))!
                      .files;
                  setState(() {
                    commercialRegisterIsPressed = false;
                  });
                  if (commercialRegister == null) return;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                      width: 345.w,
                      height: 40.h,
                      decoration: DottedDecoration(
                        shape: Shape.box,
                        color: commercialRegisterIsPressed
                            ? Colors.red
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4.h),
                        strokeWidth: 1.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_upload,
                            color: commercialRegisterIsPressed
                                ? Colors.red
                                : Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            translator.translate(
                                "vendor_registration_screen.commercial_register"),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: commercialRegisterIsPressed
                                          ? Colors.red
                                          : Theme.of(context).primaryColor,
                                    ),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () async {
                  taxCard = (await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'pdf', 'doc'],
                  ))!
                      .files;
                  setState(() {
                    taxCardIsPressed = false;
                  });
                  if (taxCard == null) return;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                      width: 345.w,
                      height: 40.h,
                      decoration: DottedDecoration(
                        shape: Shape.box,
                        color: taxCardIsPressed
                            ? Colors.red
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4.h),
                        strokeWidth: 1.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_upload,
                            color: taxCardIsPressed
                                ? Colors.red
                                : Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            translator.translate(
                                "vendor_registration_screen.tax_card"),
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: taxCardIsPressed
                                          ? Colors.red
                                          : Theme.of(context).primaryColor,
                                    ),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () async {
                  contract = (await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'pdf', 'doc'],
                  ))!
                      .files;
                  setState(() {
                    contractIsPressed = false;
                  });
                  if (contract == null) return;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                      width: 345.w,
                      height: 40.h,
                      decoration: DottedDecoration(
                        shape: Shape.box,
                        color: contractIsPressed
                            ? Colors.red
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4.h),
                        strokeWidth: 1.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload,
                              color: contractIsPressed
                                  ? Colors.red
                                  : Theme.of(context).primaryColor),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            translator.translate(
                                "vendor_registration_screen.contract"),
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: contractIsPressed
                                        ? Colors.red
                                        : Theme.of(context).primaryColor),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocListener<VendorRegistrationCubit, VendorRegistrationState>(
                listener: (context, state) {
                  if (state is VendorRegistrationIsPressed) {
                    BotToast.showText(
                        text: state.vendorRegister!.data!.message!);
                  } else if (state is VendorRegistrationIsFailed) {
                    BotToast.showText(text: state.error!);
                  }
                },
                child: CustomButton(
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      if (commercialRegister == null) {
                        setState(() {
                          commercialRegisterIsPressed = true;
                        });
                      } else if (contract == null) {
                        setState(() {
                          contractIsPressed = true;
                        });
                      } else if (taxCard == null) {
                        setState(() {
                          taxCardIsPressed = true;
                        });
                      } else {
                        BlocProvider.of<VendorRegistrationCubit>(context)
                            .postVendorRegister(
                          firstName: _firstName.text,
                          lastName: _lastName.text,
                          email: _email.text,
                          password: _password.text,
                          passwordConfirmation: _passwordConfirmation.text,
                          brandName: _brandName.text,
                          mobile: _phoneNumber.text,
                          arDescription: _arDescription.text,
                          enDescription: _enDescription.text,
                          commercialRegister: commercialRegister,
                          contract: contract,
                          taxCard: taxCard,
                        );
                      }
                    } else if (commercialRegister == null &&
                        contract == null &&
                        taxCard == null) {
                      setState(() {
                        commercialRegisterIsPressed = true;
                        taxCardIsPressed = true;
                        contractIsPressed = true;
                      });
                    }
                  },
                  width: 327.w,
                  height: 50.h,
                  borderRadius: 25.r,
                  title:
                      translator.translate("vendor_registration_screen.submit"),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
