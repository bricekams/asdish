import 'package:asdish/ui/widgets/fields/textfield.dart';
import 'package:flutter/material.dart';

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final TextInputAction textInputAction;
  final void Function(String text)? onChanged;

  const OTPInputField(
      {super.key, required this.controller, this.autoFocus = false, required this.textInputAction, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      autoFocus: autoFocus,

      onChanged: onChanged,
      keyboardType: TextInputType.number,
      textInputAction: textInputAction,
      width: 30,
      height: 40,
    );
  }
}
