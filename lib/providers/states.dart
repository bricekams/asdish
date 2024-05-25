import 'dart:async';
import 'package:flutter/cupertino.dart';

class TimerProvider with ChangeNotifier {
  bool canRequestEmailCode = true;
  bool canRequestOTP = true;
  int emailCodeTimer = 0;
  int otpTimer = 0;

  void startEmailTimer () {
    canRequestEmailCode = false;
    emailCodeTimer = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(emailCodeTimer<1) {
        canRequestEmailCode = true;
        emailCodeTimer = 0;
        timer.cancel();
      }else {
        emailCodeTimer--;
      }
      notifyListeners();
    });
  }

  void startOTPTimer () {
    canRequestOTP = false;
    otpTimer = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(otpTimer<1) {
        canRequestOTP = true;
        otpTimer = 0;
        timer.cancel();
      }else {
        otpTimer--;
      }
      notifyListeners();
    });
  }

  set setCanRequestEmailCode(bool value) {
    canRequestEmailCode = value;
    emailCodeTimer = 0;
    notifyListeners();
  }

  set setCanRequestOTP(bool value) {
    canRequestOTP = value;
    otpTimer = 0;
    notifyListeners();
  }
}
