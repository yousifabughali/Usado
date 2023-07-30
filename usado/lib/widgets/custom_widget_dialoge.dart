import 'package:flutter/material.dart';

import '../app_router/router.dart';

class CustomDialog {
  static showDialogFunction(String content, Widget? widget) {
    showDialog(
        context: AppRouter.navKey.currentContext!,
        builder: (context) => AlertDialog(
              content: widget?? Text(content),
              // actions: [
              //   TextButton(
              //           onPressed: () {
              //             AppRouter.popRouter();
              //           },
              //           child: Text("Ok"))
              // ],
            ));
  }
}
