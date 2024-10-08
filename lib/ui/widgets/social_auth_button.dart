import 'package:asdish/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const SocialAuthButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(icon: icon, text: text);
  }
}
