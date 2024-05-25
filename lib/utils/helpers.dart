import 'package:asdish/config/constants.dart';
import 'package:asdish/lib/flutter_hot_toast.dart';
import 'package:flutter/cupertino.dart';

Future<void> fakeFetch() async {
  return await Future.delayed(const Duration(seconds: 3), () {
    return;
  });
}

void toast(BuildContext context,
    {required String message, required ToastState state}) {
  Widget? widget;
  switch (state) {
    case ToastState.LOADING:
      widget = FlutterHotToast.loading(
        height: 70,
        width: MediaQuery.of(context).size.width * 0.9,
        label: Text(
          message,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
      break;
    case ToastState.ERROR:
      widget = FlutterHotToast.error(
        context,
        height: 70,
        width: MediaQuery.of(context).size.width * 0.9,
        label: Text(
          message,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
      break;
    case ToastState.SUCCESS:
      widget = FlutterHotToast.success(
        context,
        height: 70,
        width: MediaQuery.of(context).size.width * 0.9,
        label: Text(
          message,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
      break;
  }
  context.loaderOverlay.show(
    widgetBuilder: (d) => widget!,
  );
}

bool isValidEmail(String email) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+([\.][^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

bool isValidPassword(String password) {
  //todo: improve regex
  return RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$+!%?])[A-Za-z\d@#+$!%?]{8,}$')
      .hasMatch(password);
}
