import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersHistoryScreen extends StatefulWidget {
  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  bool? _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    Icons.chevron_left,
                    size: 24.w,
                  ),
                  color: Color(0xff000000),
                ),
                Text(
                  'Orders History',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18.sp),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ExpansionPanelList(
                dividerColor: Color(0xffffffff),
                elevation: 0,
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (context, isOpen) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        child: Text(
                          '',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    },
                    body: Container(
                      width: MediaQuery.of(context).size.width,
                    ),
                    isExpanded: _isOpen!,
                  ),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (context, isOpen) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        child: Text(
                          "",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    },
                    body: Text(''),
                    isExpanded: false,
                  ),
                ],
                expansionCallback: (i, isOpen) =>
                    setState(() => _isOpen = !isOpen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
