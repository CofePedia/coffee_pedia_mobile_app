import 'package:circle_checkbox/redev_checkbox.dart';
import 'package:coffepedia/business_logic/OTP/otp_cubit.dart';
import 'package:coffepedia/business_logic/auth/auth_bloc.dart';
import 'package:coffepedia/business_logic/login/login_bloc.dart';
import 'package:coffepedia/business_logic/signup/form_submission_status.dart';
import 'package:coffepedia/business_logic/signup/signup_bloc.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/repository/otp_repository.dart';
import 'package:coffepedia/data/repository/user_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/data/web_services/otp_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/screens/intro/OTP_screen.dart';
import 'package:coffepedia/ui/screens/intro/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../main.dart';
import '../../custom_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(
          create: (_) => SignupBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
            authBloc: BlocProvider.of<AuthBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => OtpCubit(
            OTPRepository(
              OTPWebServices(),
            ),
          ),
        ),
      ],
      child: LoginRegisterScreen(),
    );
  }
}

class LoginRegisterScreen extends StatefulWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginRegisterScreen> createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  bool selected = false;
  bool isLogin = true;

  @override
  void dispose() {
    _email.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _mobile.dispose();
    super.dispose();
  }

  _onLoginButtonPressed() {
    BlocProvider.of<LoginBloc>(context).add(
      LoginButtonPressed(
        password: _password.text,
        mobile: _mobile.text,
      ),
    );
  }

  _signupButtonPressed() {
    if (selected) {
      BlocProvider.of<SignupBloc>(context).add(
        SignupSubmitted(),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            translator.translate(
                "login_registration_screen.You must accept our terms & conditions and privacy policy"),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePageProvider(currentIndex: 0)));
      },
      child: Scaffold(
        body: MultiBlocListener(
          listeners: [
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) async {
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${state.error}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (state is LoginSuccess) {
                  /*// we need to get the basket and put it all(replace the existing) inside the local database
                  //1) delete all items from database.
                  final BasketRepository basketRepository = BasketRepository(BasketWebServices(),);
                  await basketRepository.truncateLocalBasket();
                  */
                  //TODO 1) get all items from the local database..
                  final BasketRepository basketRepository = BasketRepository(
                    BasketWebServices(),
                  );
                  List<Map<String, int>> basket = [];
                  print("A 1");
                  List<BasketLocal> basketInLocal =
                      await basketRepository.getAllLocalProductsFromBasket();
                  print("A 2++");
                  if (basketInLocal != null && basketInLocal.isNotEmpty) {
                    print("A 2 inside if");
                    print("A 2 " + basketInLocal.length.toString());
                    basketInLocal.forEach((element) {
                      Map<String, int> basketMap = {
                        "product_id": int.parse(element.productId.toString()),
                        "quantity": int.parse(element.quantity.toString())
                      };
                      basket.add(basketMap);
                    });
                    print("A 3");
                    //TODO 3) send all the products to the database..
                    basketRepository.getAddToBasket(basket);
                  } else {
                    print("A 2--");
                    //TODO: 4) there are no items in the local DB, so we will check if there's anything in the backend basket we need to get them and put them in the local database
                    Basket basket = await basketRepository.getBasket();
                    if (basket != null) {
                      if (basket.data!.items!.isNotEmpty) {
                        basket.data!.items!.forEach((element) {
                          BasketLocal basketLocal = BasketLocal(
                            productId: int.parse(element!.id.toString()),
                            quantity: int.parse(element.quantity.toString()),
                            priceBeforeDiscount: element.priceBeforeDiscount,
                            image: (element.images != null &&
                                    element.images!.length > 0)
                                ? element.images![0]
                                : element.image,
                            name: element.name,
                            price: element.price.toString(),
                            vendor: element.vendor,
                          );
                          basketRepository.addProductInLocalBasket(basketLocal);
                        });
                      } else {
                        // صباح الفل خلاص :D
                      }
                    }
                  }

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePageProvider(
                        currentIndex: 0,
                      ),
                    ),
                  );
                  BlocProvider.of<SignupBloc>(context).close();
                }
              },
            ),
            BlocListener<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state.formStatus is SubmissionFailed) {
                  final stateForm = state.formStatus;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          '${stateForm is SubmissionFailed ? stateForm.exception.toString() : ""}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (state.formStatus is SubmissionSuccess) {
                  BlocProvider.of<OtpCubit>(context).postSendOTP(_mobile.text);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          OTPScreenProvider(mobile: _mobile.text),
                    ),
                    // MaterialPageRoute(
                    //   builder: (context) => HomePageProvider(
                    //     currentIndex: 0,
                    //   ),
                    // ),
                  );
                  BlocProvider.of<SignupBloc>(context).close();
                }
              },
            ),
          ],
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 68.39.h,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => HomePageProvider(
                                        currentIndex: 0,
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.close,
                                  color: kGrey,
                                  size: 15.8.w,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                Assets.iconsLogoHor,
                                height: 51.3.h,
                                width: 196.w,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 79.7.h, bottom: 32.h),
                                child: Text(
                                  isLogin
                                      ? translator.translate(
                                          "login_registration_screen.login")
                                      : translator.translate(
                                          "login_registration_screen.create_account"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: kBlack,
                                      ),
                                ),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       width: 156.w,
                            //       height: 40.h,
                            //       child: ElevatedButton.icon(
                            //         onPressed: () {},
                            //         icon: SvgPicture.asset(
                            //           Assets.iconsFacebookSquare,
                            //           width: 19.3.w,
                            //           height: 19.3.h,
                            //         ),
                            //         label: Text(
                            //           "With Facebook",
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .headline2!
                            //               .copyWith(fontSize: 12.sp),
                            //         ),
                            //         style: ButtonStyle(
                            //           backgroundColor:
                            //               MaterialStateProperty.all(kDarkBlue),
                            //           shape: MaterialStateProperty.all(
                            //             RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(20.r),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       width: 156.w,
                            //       height: 40.h,
                            //       child: ElevatedButton.icon(
                            //         onPressed: () {},
                            //         icon: SvgPicture.asset(
                            //           Assets.iconsGoogle,
                            //           width: 19.3.w,
                            //           height: 19.3.h,
                            //         ),
                            //         label: Text(
                            //           "With Google",
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .headline2!
                            //               .copyWith(fontSize: 12.sp),
                            //         ),
                            //         style: ButtonStyle(
                            //           backgroundColor:
                            //               MaterialStateProperty.all(kBlue),
                            //           shape: MaterialStateProperty.all(
                            //             RoundedRectangleBorder(
                            //               borderRadius:
                            //                   BorderRadius.circular(20.r),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(
                            //     vertical: 24.h,
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Expanded(
                            //         child: Divider(
                            //           color: kLightGrey,
                            //           thickness: 0.5.h,
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 89.w,
                            //         child: Text(
                            //           isLogin ? "Or login with" : "Or",
                            //           textAlign: TextAlign.center,
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .headline2!
                            //               .copyWith(color: kLightBlack),
                            //         ),
                            //       ),
                            //       Expanded(
                            //         child: Divider(
                            //           color: kLightGrey,
                            //           thickness: 0.5.h,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            isLogin
                                ? SizedBox.shrink()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 157.w,
                                        child: CustomInput(
                                            title: translator.translate(
                                                "login_registration_screen.first_name"),
                                            hint: translator.translate(
                                                "login_registration_screen.first_name"),
                                            textEditingController: _firstName,
                                            textInputType: TextInputType.name,
                                            padding: false,
                                            onChanged: (value) {
                                              context.read<SignupBloc>().add(
                                                    SignupFirstNameChanged(
                                                        firstName: value),
                                                  );
                                            }),
                                      ),
                                      SizedBox(
                                        width: 157.w,
                                        child: CustomInput(
                                          title: translator.translate(
                                              "login_registration_screen.last_name"),
                                          hint: translator.translate(
                                              "login_registration_screen.last_name"),
                                          textEditingController: _lastName,
                                          textInputType: TextInputType.name,
                                          padding: false,
                                          onChanged: (value) =>
                                              context.read<SignupBloc>().add(
                                                    SignupLastNameChanged(
                                                        lastName: value),
                                                  ),
                                        ),
                                      )
                                    ],
                                  ),
                            isLogin
                                ? SizedBox.shrink()
                                : CustomInput(
                                    padding: false,
                                    title: translator.translate(
                                        "login_registration_screen.email_address"),
                                    hint: translator.translate(
                                        "login_registration_screen.email_address"),
                                    textEditingController: _email,
                                    onChanged: (value) {
                                      return context.read<SignupBloc>().add(
                                            SignupEmailChanged(email: value),
                                          );
                                    }),
                            CustomInput(
                              textInputType: TextInputType.number,
                              title: translator.translate(
                                  "login_registration_screen.mobile"),
                              hint: translator.translate(
                                  "login_registration_screen.mobile"),
                              textEditingController: _mobile,
                              icon: false,
                              padding: false,
                              onChanged: (value) =>
                                  context.read<SignupBloc>().add(
                                        SignupMobileChanged(mobile: value),
                                      ),
                            ),

                            CustomInput(
                              title: translator.translate(
                                  "login_registration_screen.password"),
                              hint: translator.translate(
                                  "login_registration_screen.password"),
                              textEditingController: _password,
                              icon: true,
                              padding: false,
                              onChanged: (value) =>
                                  context.read<SignupBloc>().add(
                                        SignupPasswordChanged(password: value),
                                      ),
                            ),

                            isLogin
                                ? SizedBox.shrink()
                                : CustomInput(
                                    title: translator.translate(
                                        "login_registration_screen.confirm_password"),
                                    hint: translator.translate(
                                        "login_registration_screen.confirm_password"),
                                    textEditingController: _confirmPassword,
                                    padding: false,
                                    icon: true,
                                    onChanged: (value) =>
                                        context.read<SignupBloc>().add(
                                              SignupPasswordConfirmationChanged(
                                                  passwordConfirmation: value),
                                            ),
                                  ),
                            isLogin
                                ? Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return ForgetPasswordScreen();
                                              },
                                            ),
                                          );
                                        },
                                        child: Text(
                                          translator.translate(
                                              "login_registration_screen.forget_password"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(color: kRed),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                  top: isLogin ? 10.h : 16.h, bottom: 32.h),
                              height: 50.h,
                              child: ElevatedButton(
                                onPressed: !isLogin
                                    ? _signupButtonPressed
                                    : state is! LoginLoading
                                        ? _onLoginButtonPressed
                                        : null,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  isLogin
                                      ? translator.translate(
                                          "login_registration_screen.login")
                                      : translator.translate(
                                          "login_registration_screen.create_account"),
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                            ),
                            isLogin
                                ? SizedBox(
                                    height: 32.h,
                                  )
                                : Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: CircleCheckboxListTile(
                                      title: RichText(
                                        textAlign: TextAlign.end,
                                        text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                color: kLightBlack,
                                              ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: translator.translate(
                                                  "login_registration_screen.accept_msg"),
                                            ),
                                            TextSpan(
                                              text: translator.translate(
                                                  "login_registration_screen.terms_n_conditions"),
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                                text:
                                                    ' ${translator.translate("login_registration_screen.and")} '),
                                            TextSpan(
                                              text: translator.translate(
                                                  "login_registration_screen.privacy_policy"),
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      value: selected,
                                      onChanged: (value) => setState(() {
                                        selected = value!;
                                      }),
                                      dense: true,
                                      contentPadding: EdgeInsets.all(0),
                                      activeColor: kGreen,
                                    ),
                                  ),
                            Padding(
                              padding: EdgeInsets.only(top: 32.h, bottom: 6.h),
                              child: Text(
                                isLogin
                                    ? translator.translate(
                                        "login_registration_screen.dont_have_account")
                                    : translator.translate(
                                        "login_registration_screen.have_an_account"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: kLightBlack,
                                    ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isLogin = !isLogin;
                                });
                              },
                              child: Text(
                                isLogin
                                    ? translator.translate(
                                        "login_registration_screen.create_account")
                                    : translator.translate(
                                        "login_registration_screen.login"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
