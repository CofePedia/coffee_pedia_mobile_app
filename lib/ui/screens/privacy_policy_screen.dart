import 'package:coffepedia/business_logic/static_pages/static_pages_cubit.dart';
import 'package:coffepedia/data/repository/static_pages_repository.dart';
import 'package:coffepedia/data/web_services/static_pages_web_services.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'check_internet_connection.dart';

class PrivacyPolicyScreenProvider extends StatelessWidget {
  const PrivacyPolicyScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StaticPagesCubit(
        StaticPagesRepository(
          StaticPagesWebServices(),
        ),
      ),
      child: PrivacyPolicyScreen(),
    );
  }
}

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  void initState() {
    BlocProvider.of<StaticPagesCubit>(context).getPrivacyPolicy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60.h),
            child: BlocBuilder<StaticPagesCubit, StaticPagesState>(
              builder: (context, state) {
                if (state is PrivacyPolicyIsLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h, left: 18.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20.w,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            HtmlWidget(
                              state.staticPage!.data!.title ?? '',
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 18.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      state.staticPage!.data!.image == null &&
                              state.staticPage!.data!.image == ""
                          ? CustomNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              height: 200.h,
                              radius: 2,
                              imageUrl: state.staticPage!.data!.image!,
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                        height: 11.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: HtmlWidget(
                          state.staticPage!.data!.description ?? "",
                          textStyle: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: state.staticPage!.data!.feature!.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: HtmlWidget(
                                state.staticPage!.data!.feature![index]!
                                        .title ??
                                    '',
                                textStyle: Theme.of(context).textTheme.caption,
                              ),
                            ),
                            state.staticPage!.data!.feature![index]!.image ==
                                        null &&
                                    state.staticPage!.data!.feature![index]!
                                            .image ==
                                        ""
                                ? Column(
                                    children: [
                                      SizedBox(height: 10.h),
                                      CustomNetworkImage(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200.h,
                                        radius: 2,
                                        imageUrl: state.staticPage!.data!
                                            .feature![index]!.image!,
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink(),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: HtmlWidget(
                                state.staticPage!.data!.feature![index]!
                                        .description ??
                                    '',
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
