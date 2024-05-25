import 'package:asdish/config/extensions.dart';
import 'package:asdish/providers/states.dart';
import 'package:asdish/ui/widgets/fields/otp.dart';
import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OTPWidget extends StatelessWidget {
  final String description;
  final bool? verifying;

  final void Function(String code)? onVerify;
  final bool? canChangePhone;

  static TextEditingController otp_1 = TextEditingController();
  static TextEditingController otp_2 = TextEditingController();
  static TextEditingController otp_3 = TextEditingController();
  static TextEditingController otp_4 = TextEditingController();
  static TextEditingController otp_5 = TextEditingController();
  static TextEditingController otp_6 = TextEditingController();
  static List<TextEditingController> controllers = [
    otp_1,
    otp_2,
    otp_3,
    otp_4,
    otp_5,
    otp_6,
  ];

  const OTPWidget(
      {super.key,
      required this.description,
      this.onVerify,
      this.canChangePhone = true, this.verifying = false});

  @override
  Widget build(BuildContext context) {
    TimerProvider timerProvider = context.read<TimerProvider>();
    TimerProvider timerProviderWatch = context.watch<TimerProvider>();

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
                              color: Theme.of(context).colorScheme.onSurface,
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
                  const SizedBox(height: 25),
                  Row(
                    children: controllers
                        .indexedMap(
                          (e, i) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: OTPInputField(
                              controller: e,
                              autoFocus: i == 0,
                              onChanged: (text) {
                                if (i != controllers.length - 1) {
                                  if (e.value.text.isNotEmpty) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                }
                              },
                              textInputAction: i == controllers.length - 1
                                  ? TextInputAction.next
                                  : TextInputAction.done,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.primary.withOpacity(
                                  timerProvider.canRequestOTP ? 1 : 0.3,
                                ),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text:
                              "Resend code ${timerProviderWatch.canRequestOTP ? "" : "? ${timerProviderWatch.otpTimer}"}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PrimaryButton(
                        loading: verifying,
                        onPressed: () {
                          String code =
                              controllers.map((e)=>e.text).toList().join("");
                          if (onVerify != null) onVerify!(code);
                        },
                        text: "Verify",
                        width: 180,
                      ),
                    ],
                  ),
                  if (canChangePhone!) const SizedBox(height: 30),
                  if (canChangePhone!)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            timerProvider.setCanRequestOTP = true;
                            context.pop();
                          },
                          child: Text(
                            "Change phone number?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
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
