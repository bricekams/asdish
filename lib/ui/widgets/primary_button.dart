import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrimaryButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function()? onPressed;

  const PrimaryButton(
      {super.key, this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 80),
        ),
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
        foregroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: onPressed,
      icon: icon != null
          ? FaIcon(
              icon,
              size: 20,
            )
          : const SizedBox(),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
