import 'package:asdish/ui/screens/auth/phone_otp.dart';
import 'package:asdish/ui/widgets/screens/email_code.dart';
import 'package:asdish/ui/widgets/screens/otp.dart';
import 'package:flutter/material.dart';

class CodePasswordReset extends StatelessWidget {
  final bool phoneOTP;

  const CodePasswordReset({super.key, required this.phoneOTP});

  @override
  Widget build(BuildContext context) {
    return phoneOTP
        ? const OTPWidget(description: "description")
        : const EmailCodeWidget(description: "desc");
  }
}
