import 'dart:async';
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
  final FutureOr<void> Function(PhoneAuthCredential credential)
      verificationCompleted;

  const OTPScreen({
    super.key,
    required this.verificationId,
    this.resendToken,
    required this.verificationCompleted,
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
        try {
          await auth.signInWithCredential(credential);

          await widget.verificationCompleted(credential);
          setState(() {
            verifying = false;
          });
          if (context.mounted) context.go("/");
        } catch (e) {
          setState(() {
            verifying = false;
          });
          if (e is FirebaseAuthException) {
            if (context.mounted) {
              toast(context, message: e.code, state: ToastState.ERROR);
            }
          } else {
            log(e.toString());
          }
        }
      },
      canChangePhone: true,
    );
  }
}
