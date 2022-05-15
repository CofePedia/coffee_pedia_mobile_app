import 'package:coffepedia/ui/widgets/loader.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, setState) => Container(
              color: Colors.transparent,
              child: AlertDialog(
                content: SmallLoader(),
                backgroundColor: Colors.black45.withOpacity(0.1),
                // contentPadding: EdgeInsets.zero,
                // actionsPadding: EdgeInsets.zero,
                // buttonPadding: EdgeInsets.zero,
                // titlePadding: EdgeInsets.zero,
                // insetPadding: EdgeInsets.zero,
                // backgroundColor: Colors.transparent,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ));
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return LoadingDialog();
      });
}

void dismissDialog(BuildContext context) {
  Navigator.pop(context);
}
