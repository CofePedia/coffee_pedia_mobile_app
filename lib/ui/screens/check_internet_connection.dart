import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'no_internet_screen.dart';

class CheckInternetConnection extends StatelessWidget {
  final Widget screen;
  const CheckInternetConnection({required this.screen, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return screen;
        } else {
          return NoInternetScreen();
        }
      },
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
