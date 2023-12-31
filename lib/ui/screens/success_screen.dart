import 'package:coffepedia/business_logic/make_order/make_order_cubit.dart';
import 'package:coffepedia/data/repository/make_order_repository.dart';
import 'package:coffepedia/data/web_services/make_order_web_services.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/widgets/failed_payment_widget.dart';
import 'package:coffepedia/ui/widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SuccessScreenProvider extends StatelessWidget {
  final int paymentId;
  final String addressId;
  final String coupon;

  const SuccessScreenProvider({
    required this.addressId,
    required this.paymentId,
    required this.coupon,
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
        coupon: coupon,
      ),
    );
  }
}

class SuccessScreen extends StatefulWidget {
  final int paymentId;
  final String addressId;
  final String coupon;

  const SuccessScreen({
    required this.addressId,
    required this.paymentId,
    required this.coupon,
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  InAppWebViewController? webView;
  double progress = 0;

  @override
  void initState() {
    BlocProvider.of<MakeOrderCubit>(context).getMakeOrder(
      widget.addressId.toString(),
      widget.paymentId.toString(),
      widget.coupon,
    );
    print('widget.addressId ${widget.addressId}');
    print('widget.paymentId ${widget.paymentId}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePageProvider(
                      currentIndex: 0,
                    );
                  },
                ),
              );
            },
          ),
        ),
        body: BlocBuilder<MakeOrderCubit, MakeOrderState>(
          builder: (context, state) {
            if (state is MakeOrderIsLoaded) {
              if (state.makeOrder!.data!.cashierUrl != null) {
                return SafeArea(
                  child: Column(
                    children: [
                      (progress != 1.0)
                          ? LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor,
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: InAppWebView(
                            initialUrlRequest: URLRequest(
                              url: Uri.parse(
                                state.makeOrder!.data!.cashierUrl!,
                              ),
                            ),

                            initialOptions: InAppWebViewGroupOptions(
                              crossPlatform: InAppWebViewOptions(
                                useShouldOverrideUrlLoading: true,
                                mediaPlaybackRequiresUserGesture: false,
                              ),
                              android: AndroidInAppWebViewOptions(
                                useHybridComposition: true,
                              ),
                              ios: IOSInAppWebViewOptions(
                                allowsInlineMediaPlayback: true,
                              ),
                            ),
                            onWebViewCreated:
                                (InAppWebViewController controller) {
                              webView = controller;
                            },
                            onLoadStop:
                                (InAppWebViewController controller, url) {
                              if (url.toString().contains("/api/opay/return")) {
                                print('amrStop');
                                print("paymentUrlAmrStop $url");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SuccessWidgetProvider(
                                      message: state.makeOrder!.data!.msg!,
                                      orderId: state.makeOrder!.data!.orderId!
                                          .toString(),
                                    ),
                                  ),
                                );
                              } else if (url
                                  .toString()
                                  .contains("api/opay/cancel")) {
                                print('azzamStop');
                                print("paymentUrlAzzamStop $url");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FailedPaymentWidget(
                                      message: state.makeOrder!.data!.msg!,
                                      orderId: state.makeOrder!.data!.orderId!
                                          .toString(),
                                    ),
                                  ),
                                );
                              }
                            },
                            onLoadStart:
                                (InAppWebViewController controller, url) {
                              if (url.toString().contains("/api/opay/return")) {
                                print('amrStart');
                                print("paymentUrlAmrStart $url");

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SuccessWidgetProvider(
                                      message: state.makeOrder!.data!.msg!,
                                      orderId: state.makeOrder!.data!.orderId!
                                          .toString(),
                                    ),
                                  ),
                                );
                              } else if (url
                                  .toString()
                                  .contains("api/opay/cancel")) {
                                print('azzamStart');
                                print("paymentUrlAzzamStart $url");

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FailedPaymentWidget(
                                      message: state.makeOrder!.data!.msg!,
                                      orderId: state.makeOrder!.data!.orderId!
                                          .toString(),
                                    ),
                                  ),
                                );
                              }
                            },

                            // onLoadError: (InAppWebViewController controller, url,
                            //     int status, String code) {
                            //   if (url.toString().contains("/api/opay/return")) {
                            //     print('amrError');
                            //     print("paymentUrlAmrError $url");
                            //
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 DeliveryInfoScreenProvider()));
                            //   } else if (url.toString().contains("api/opay/cancel")) {
                            //     print('azzamError');
                            //     print("paymentUrlAzzamError $url");
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 DeliveryInfoScreenProvider()));
                            //   }
                            // },
                            // onLoadStart: (InAppWebViewController controller, url) {
                            //   if (url.toString().contains("/api/opay/return")) {
                            //     print('amrStart');
                            //     print("paymentUrlAmrStart $url");
                            //
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 DeliveryInfoScreenProvider()));
                            //   } else if (url.toString().contains("api/opay/cancel")) {
                            //     print('azzamStart');
                            //     print("paymentUrlAzzamStart $url");
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 DeliveryInfoScreenProvider()));
                            //   }
                            // },
                            onProgressChanged:
                                (InAppWebViewController controller,
                                    int progress) {
                              setState(() {
                                this.progress = progress / 100;
                                print('onProgressChangeAmr $progress');
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SuccessWidgetProvider(
                  message: state.makeOrder!.data!.msg!,
                  orderId: state.makeOrder!.data!.orderId!.toString(),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ));
  }
}
