import 'package:asdish/ui/widgets/fields/otp.dart';
import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  static TextEditingController otp_1 = TextEditingController();
  static TextEditingController otp_2 = TextEditingController();
  static TextEditingController otp_3 = TextEditingController();
  static TextEditingController otp_4 = TextEditingController();
  static TextEditingController otp_5 = TextEditingController();
  static List<TextEditingController> controllers = [
    otp_1,
    otp_2,
    otp_3,
    otp_4,
    otp_5
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.security,
                  size: 70,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  "Phone number \nverification",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 23),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onBackground,
                            ),
                            text:
                                "A 5 digits code has been sent to your phone number 6****, please enter it to "
                                "verify that you own this phone number.",
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            text: " Learn more.",
                          ),
                        ]),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: controllers
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: OTPInputField(controller: e),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      children: const [
                        TextSpan(text: "Didn't receive the code?"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PrimaryButton(
                        text: "Verify",
                        width: 65,
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
