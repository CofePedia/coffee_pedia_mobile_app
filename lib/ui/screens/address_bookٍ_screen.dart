import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/address/address_cubit.dart';
import 'package:coffepedia/constants/colors.dart';
import 'package:coffepedia/data/repository/address_repository.dart';
import 'package:coffepedia/data/web_services/address_web_services.dart';
import 'package:coffepedia/ui/screens/address_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressBookScreenProvider extends StatelessWidget {
  static const routeName = '/address-book-screen-provider';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(
        AddressRepository(
          AddressWebServices(),
        ),
      ),
      child: AddressBookScreen(),
    );
  }
}

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({Key? key}) : super(key: key);

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  @override
  void initState() {
    BlocProvider.of<AddressCubit>(context).getMyAddresses();

    super.initState();
  }

  String _value = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is UpdateAddressIsPressed) {
            BotToast.showText(text: state.updateAddress!.data!.msg!);
            BlocProvider.of<AddressCubit>(context).getMyAddresses();
          } else if (state is DeleteAddressIsPressed) {
            BotToast.showText(text: state.deleteAddress!.data!.msg!);
            BlocProvider.of<AddressCubit>(context).getMyAddresses();
          }
        },
        child: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            if (state is MyAddressesIsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 23.w,
                        right: 23.w,
                        top: 60.h,
                        bottom: 18.h,
                      ),
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
                            style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                      fontSize: 18.sp,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, state) {
                        if (state is MyAddressesIsLoaded) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: state.myAddresses!.data!.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 12.h),
                              child: Container(
                                height: 111.h,
                                width: 343.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.r),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            state.myAddresses!.data![index]!
                                                .name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(
                                                  fontSize: 14.sp,
                                                ),
                                          ),
                                          state.myAddresses!.data![index]!
                                                      .primary ==
                                                  1
                                              ? Container(
                                                  height: 17.h,
                                                  width: 67.w,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Color(
                                                      0xffFFD008,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        12.5.r,
                                                      ),
                                                      bottomRight:
                                                          Radius.circular(
                                                        12.5.r,
                                                      ),
                                                      bottomLeft:
                                                          Radius.circular(
                                                        12.5.r,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Primary',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1!
                                                        .copyWith(
                                                            fontSize: 10.sp),
                                                  ),
                                                )
                                              : PopupMenuButton(
                                                  itemBuilder: (cxt) => [
                                                    PopupMenuItem(
                                                      child: Text(
                                                        "Primary",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4,
                                                      ),
                                                      value: 1,
                                                      onTap: () {
                                                        setState(() {
                                                          BlocProvider.of<
                                                                      AddressCubit>(
                                                                  context)
                                                              .postUpdateAddress(
                                                            primary:
                                                                1.toString(),
                                                            addressId: state
                                                                .myAddresses!
                                                                .data![index]!
                                                                .id!
                                                                .toString(),
                                                            name: state
                                                                .myAddresses!
                                                                .data![index]!
                                                                .name!
                                                                .toString(),
                                                            details: state
                                                                .myAddresses!
                                                                .data![index]!
                                                                .details!
                                                                .toString(),
                                                            street: state
                                                                .myAddresses!
                                                                .data![index]!
                                                                .street!
                                                                .toString(),
                                                            areaId: state
                                                                .myAddresses!
                                                                .data![index]!
                                                                .areaId!
                                                                .toString(),
                                                            cityId: state
                                                                .myAddresses!
                                                                .data![index]!
                                                                .cityId!
                                                                .toString(),
                                                            governorateId: state
                                                                .myAddresses!
                                                                .data![index]!
                                                                .governorateId!
                                                                .toString(),
                                                          );
                                                        });
                                                      },
                                                    ),
                                                    PopupMenuItem(
                                                      child: Text(
                                                        "Edit",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4,
                                                      ),
                                                      value: 2,
                                                    ),
                                                    PopupMenuItem(
                                                      child: Text(
                                                        "Delete",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4,
                                                      ),
                                                      value: 3,
                                                      onTap: () {
                                                        setState(() {
                                                          BlocProvider.of<
                                                                      AddressCubit>(
                                                                  context)
                                                              .postDeleteAddress(
                                                            state
                                                                .myAddresses!
                                                                .data![index]!
                                                                .id!
                                                                .toString(),
                                                          );
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                  onSelected: (value) {
                                                    setState(() {
                                                      _value = value.toString();
                                                    });
                                                    if (value == 2)
                                                      showModalBottomSheet(
                                                        enableDrag: false,
                                                        isDismissible: false,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    25.r),
                                                            topRight:
                                                                Radius.circular(
                                                                    25.r),
                                                          ),
                                                        ),
                                                        context: context,
                                                        isScrollControlled:
                                                            true,
                                                        builder: (context) =>
                                                            AddAddressSheetProvider(
                                                          addressPath:
                                                              AddressBookScreenProvider(),
                                                          address: state
                                                              .myAddresses!
                                                              .data![index],
                                                        ),
                                                      );
                                                    print(_value);
                                                  },
                                                  child: Icon(
                                                    Icons.more_vert,
                                                    color: kBlue,
                                                    size: 25.h,
                                                  ),
                                                ),
                                          // : InkWell(
                                          //     onTap: () {},
                                          //     child: Icon(
                                          //       Icons.more_vert,
                                          //       color: Theme.of(context).primaryColor,
                                          //       size: 30.h,
                                          //     ),
                                          //   ),
                                        ],
                                      ),
                                      RichText(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: state
                                                          .myAddresses!
                                                          .data![index]!
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
                                            TextSpan(
                                              text:
                                                  '${state.myAddresses!.data![index]!.area!}, ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
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
                                    ],
                                  ),
                                ),
                              ),
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
                            addressPath: AddressBookScreenProvider(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 12.h),
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
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
