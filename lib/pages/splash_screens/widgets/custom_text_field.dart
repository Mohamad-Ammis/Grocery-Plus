import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.hintStyle,
    required this.textStyle,
    required this.cursorColor,
    required this.label,
    required this.labelStyle,
    required this.filled,
    required this.fillColor,
    required this.prefixIcon,
    required this.suffixIcon,
    this.isUserName,
    this.isEmail,
  });
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final Color cursorColor;
  final String? label;
  final TextStyle? labelStyle;
  final bool filled;
  final Color fillColor;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool? isEmail;
  final bool? isUserName;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   if (isEmail ?? false) {
      //     return FormValidators().emailValidator(value);
      //   } else if (isUserName ?? false) {
      //     return FormValidators().userNameValidator(value);
      //   } else {
      //     return null;
      //   }
      // },
      cursorColor: cursorColor,
      style: textStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: const Color(0xFF37474F),
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 8, 16),
        label: label != null ? Text(label!) : null,
        labelStyle: labelStyle,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: const Color(0xFF37474F),
                  )
                : null),
      ),
    );
  }
}
