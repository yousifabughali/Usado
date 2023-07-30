import 'package:flutter/material.dart';

import '../app_router/router.dart';

class CustomDialog {
  static showDialogFunction(String content){
    showDialog(
        context: AppRouter.navKey.currentContext!,
        builder: (context) => AlertDialog(
          content: Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  AppRouter.popRouter();
                },
                child: Text("Ok"))
          ],
        ));
  }
}