import 'package:coffepedia/business_logic/make_order/make_order_cubit.dart';
import 'package:coffepedia/data/repository/make_order_repository.dart';
import 'package:coffepedia/data/web_services/make_order_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/screens/orders_history_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreenProvider extends StatelessWidget {
  final int paymentId;
  final int addressId;
  const SuccessScreenProvider({
    required this.addressId,
    required this.paymentId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MakeOrderCubit(
        MakeOrderRepository(
          MakeOrderWebServices(),
        ),
      ),
      child: SuccessScreen(
        paymentId: paymentId,
        addressId: addressId,
      ),
    );
  }
}

class SuccessScreen extends StatefulWidget {
  final int paymentId;
  final int addressId;

  const SuccessScreen({
    required this.addressId,
    required this.paymentId,
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    BlocProvider.of<MakeOrderCubit>(context).getMakeOrder(
      widget.addressId.toString(),
      widget.paymentId.toString(),
    );
    print('widget.addressId ${widget.addressId}');
    print('widget.paymentId ${widget.paymentId}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MakeOrderCubit, MakeOrderState>(
        builder: (context, state) {
          if (state is MakeOrderIsLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Thank You',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontSize: 22.sp,
                        ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Text(
                    state.makeOrder!.data!.msg!,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SvgPicture.asset(
                    Assets.successIcon,
                    height: 102.h,
                    width: 102.w,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Order ID #${state.makeOrder!.data!.orderId!}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'You will recieve an email with your order details and the expecting shipping date',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomButton(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrdersHistoryProvider();
                          },
                        ),
                      );
                    },
                    title: 'Track your order',
                    height: 50.h,
                    width: 345.w,
                    imageWidth: 0,
                    imageHeight: 0,
                    buttonColor: Theme.of(context).primaryColor,
                    borderRadius: 25.sp,
                    imageColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomePage(currentIndex: 0);
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Continue Shopping',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Color(0xff007CC6),
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
    );
  }
}
