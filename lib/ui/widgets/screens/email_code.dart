import 'package:asdish/providers/states.dart';
import 'package:asdish/ui/widgets/fields/textfield.dart';
import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EmailCodeWidget extends StatelessWidget {
  final String description;
  final void Function()? onVerify;
  final bool? canChangeEmail;
  const EmailCodeWidget({super.key, required this.description, this.onVerify, this.canChangeEmail = true});

  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = TextEditingController();
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
                  "Email address \nverification",
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
                            text: description,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: CustomTextField(
                      controller: codeController,
                      label: const Text("Code"),
                      autoFocus: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color:
                        Theme.of(context).colorScheme.primary.withOpacity(
                          timerProvider.canRequestEmailCode ? 1 : 0.3,
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text:
                          "Resend code${timerProviderWatch.canRequestEmailCode ? "" : "? ${timerProviderWatch.emailCodeTimer}"}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PrimaryButton(
                        onPressed: onVerify,
                        text: "Verify",
                        width: 180,
                      ),
                    ],
                  ),
                  if(canChangeEmail!) const SizedBox(height: 30),
                  if(canChangeEmail!)  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          timerProvider.setCanRequestEmailCode = true;
                          context.pop();
                        },
                        child: Text(
                          "Change email address?",
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
