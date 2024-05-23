import 'package:asdish/ui/widgets/fields/textfield.dart';
import 'package:flutter/material.dart';

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  const OTPInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(controller: controller, width: 30, height: 40,);
  }
}
