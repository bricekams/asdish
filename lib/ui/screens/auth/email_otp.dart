import 'package:asdish/ui/widgets/screens/email_code.dart';
import 'package:flutter/material.dart';

class EmailCodeScreen extends StatelessWidget {
  const EmailCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmailCodeWidget(
      description:
          "A code has been sent to your email address ***@gmail.com, please enter it to "
          "verify that you own this email address.",
      onVerify: () {},
    );
  }
}
