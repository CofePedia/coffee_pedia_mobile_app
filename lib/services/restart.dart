import 'package:flutter/material.dart';


class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget? child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    // ExternalLinksServices.instance.page = null;
    // ExternalLinksServices.instance.deepLinkPage = false;
    //Constants.restartApp = true;
    setState(() {
      key = UniqueKey();
    });
//    navService.navigatorKeys[TabItem.offers] = GlobalKey<NavigatorState>();
//    navService.navigatorKeys[TabItem.profile] = GlobalKey<NavigatorState>();
//    navService.navigatorKeys[TabItem.myOrder] = GlobalKey<NavigatorState>();
//    navService.navigatorKeys[TabItem.inviteFriend] = GlobalKey<NavigatorState>();
//    navService.navigatorKeys[TabItem.CashBack] = GlobalKey<NavigatorState>();
//    navService.mainNavigationKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
