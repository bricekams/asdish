import 'dart:developer';

import 'package:asdish/config/constants.dart';
import 'package:asdish/ui/widgets/screens/otp.dart';
import 'package:asdish/utils/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class OTPScreen extends StatefulWidget {
  final String verificationId;
  final int? resendToken;

  const OTPScreen({
    super.key,
    required this.verificationId,
    this.resendToken,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool verifying = false;

  @override
  Widget build(BuildContext context) {
    return OTPWidget(
      verifying: verifying,
      description:
          "A 5 digits code has been sent to your phone number 6****, please enter it to "
          "verify that you own this phone number.",
      onVerify: (code) async {
        setState(() {
          verifying = true;
        });
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: code,
        );
        auth.signInWithCredential(credential).then((onValue) {
          context.replace("/");
        }).catchError((error) {
          if (error is FirebaseAuthException) {
            toast(context, message: error.code, state: ToastState.ERROR);
          } else {
            log(error);
          }
        }).whenComplete(() {
          setState(() {
            verifying = false;
          });
        });
      },
      canChangePhone: true,
    );
  }
}
