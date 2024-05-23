import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? label;
  final bool? readOnly;
  final String? initialValue;
  final TextEditingController controller;
  final void Function()? onTap;
  final void Function(PointerDownEvent pointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final AutovalidateMode? autoValidateMode;
  final int? maxLength;
  final TextInputType? keyboardType;
  final double? width;
  final double? height;

  const CustomTextField(
      {super.key,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText,
      this.label,
      this.readOnly,
      this.initialValue,
      required this.controller,
      this.onTap,
      this.onTapOutside,
      this.validator,
      this.textInputAction,
      this.onFieldSubmitted,
      this.obscureText,
      this.autoValidateMode,
      this.maxLength,
      this.keyboardType,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLength: maxLength,
      validator: validator,
      onTapOutside: onTapOutside,
      initialValue: initialValue,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: autoValidateMode,
      keyboardType: keyboardType,
      controller: controller,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        label: label,
        constraints: width != null && height != null
            ? BoxConstraints.loose(Size(width!, height!))
            : null,
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
