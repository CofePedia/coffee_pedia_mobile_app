import 'package:appmetrica_sdk/appmetrica_sdk.dart';
import 'package:coffepedia/business_logic/address/address_cubit.dart';
import 'package:coffepedia/data/repository/address_repository.dart';
import 'package:coffepedia/data/web_services/address_web_services.dart';
import 'package:coffepedia/ui/screens/address_bottom_sheet.dart';
import 'package:coffepedia/ui/screens/order_summary_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import 'screens/check_internet_connection.dart';

class DeliveryInfoScreenProvider extends StatelessWidget {
  const DeliveryInfoScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(
        AddressRepository(
          AddressWebServices(),
        ),
      ),
      child: DeliveryInfoScreen(),
    );
  }
}

class DeliveryInfoScreen extends StatefulWidget {
  const DeliveryInfoScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryInfoScreen> createState() => _DeliveryInfoScreenState();
}

class _DeliveryInfoScreenState extends State<DeliveryInfoScreen> {
  int? _selectedIndex;
  int? _addressId = 0;

  @override
  void initState() {
    BlocProvider.of<AddressCubit>(context).getMyAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Scaffold(
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          height: 107.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Color.fromRGBO(0, 0, 0, 0.04),
            //     blurRadius: 2.r,
            //   )
            // ],
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.r),
              topRight: Radius.circular(22.r),
            ),
          ),
          child: CustomButton(
            title: translator.translate("delivery_info_screen.continue"),
            onPress: _addressId == 0
                ? () {}
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OrderSummaryProvider(
                              addressId: _addressId!.toString());
                          // return PaymentInfoScreenProvider(
                          //   addressId: _addressId!,
                          // );
                        },
                      ),
                    );
                    AppmetricaSdk().reportEvent(name: 'Address Id $_addressId');
                  },
            width: 345.w,
            height: 50.h,
            borderRadius: 25.r,
            buttonColor:
                _addressId == 0 ? Colors.grey : Theme.of(context).primaryColor,
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
                      Icons.arrow_back_ios,
                      size: 20.w,
                    ),
                    color: Color(0xff000000),
                  ),
                  Text(
                    translator.translate("delivery_info_screen.delivery_info"),
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
                      width: 25.w,
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
                    Container(
                      height: 27.h,
                      width: 25.w,
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
                      width: 25.w,
                      alignment: Alignment.center,
                      child: Text(
                        '3',
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
                    translator.translate("delivery_info_screen.delivery_info"),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    translator.translate("checkout_items_screen.order_summary"),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Color(0xff9D9D9D), fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    translator.translate("delivery_info_screen.payment_info"),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Color(0xff9D9D9D), fontSize: 12.sp),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 27.h, horizontal: 15.w),
                child: Text(
                  translator
                      .translate("delivery_info_screen.from_address_book"),
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  if (state is MyAddressesIsLoaded) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.myAddresses!.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 15.w),
                            child: Container(
                              height: 111.h,
                              width: 343.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.r),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: _selectedIndex == index
                                //         ? Color.fromRGBO(16, 124, 192, 0.41)
                                //         : Colors.transparent,
                                //     blurRadius: 7.r,
                                //   ),
                                // ],
                              ),
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.zero,
                                  ),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(
                                      color: _selectedIndex == index
                                          ? Theme.of(context).primaryColor
                                          : Color(0xffE3E3E3),
                                    ),
                                  ),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
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
                                      _addressId =
                                          state.myAddresses!.data![index]!.id!;
                                      print('addressID: $_addressId');
                                    });
                                  },
                                  contentPadding: EdgeInsets.all(15.h),
                                  title: Text(
                                    state.myAddresses!.data![index]!.name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                          fontSize: 14.sp,
                                        ),
                                  ),
                                  subtitle: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: state.myAddresses!.data![index]!
                                                      .details! ==
                                                  ''
                                              ? ''
                                              : '${state.myAddresses!.data![index]!.details!}, ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        TextSpan(
                                          text:
                                              '${state.myAddresses!.data![index]!.street!}, ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        // TextSpan(
                                        //   text:
                                        //       '${state.myAddresses!.data![index]!.area!}, ',
                                        //   style: Theme.of(context)
                                        //       .textTheme
                                        //       .headline4,
                                        // ),
                                        TextSpan(
                                          text:
                                              '${state.myAddresses!.data![index]!.city!}, ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        TextSpan(
                                          text:
                                              '${state.myAddresses!.data![index]!.governorate!}.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
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
                    builder: (context) => AddAddressSheetProvider(
                      addressPath: DeliveryInfoScreenProvider(),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
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
                        translator
                            .translate("delivery_info_screen.add_new_address"),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
