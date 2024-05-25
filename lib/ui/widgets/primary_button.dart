import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrimaryButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final double? width;
  final double? height;
  final bool? loading;
  final void Function()? onPressed;

  const PrimaryButton({
    super.key,
    this.icon,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      minWidth: width ?? 250,
      height: height ?? 38,
      textColor: Theme.of(context).colorScheme.onPrimary,
      disabledColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            FaIcon(
              icon,
              size: 17,
            ),
          if (icon != null) const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (loading!) const SizedBox(width: 10),
          if (loading!)
            SizedBox(
              height: 14,
              width: 14,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
        ],
      ),
    );
  }
}
