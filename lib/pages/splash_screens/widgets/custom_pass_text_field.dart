import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField(
      {super.key,
      required this.textStyle,
      required this.cursorColor,
      required this.label,
      required this.labelStyle,
      required this.filled,
      required this.fillColor,
      required this.hintText,
      required this.hintStyle,
      this.prefixIcon});
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle textStyle;
  final Color cursorColor;
  final String? label;
  final TextStyle? labelStyle;
  final bool filled;
  final Color fillColor;
  final IconData? prefixIcon;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;
  IconData suffixIcon = FontAwesomeIcons.eyeSlash;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   return FormValidators().strongPasswordValidator(value);
      // },

      obscureText: obscureText,
      cursorColor: widget.cursorColor,
      style: widget.textStyle,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: const Color(0xFF37474F),
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 8, 16),
        label:widget.label!=null? Text(widget.label!):null,
        labelStyle: widget.labelStyle,
        filled: widget.filled,
        fillColor: widget.fillColor,
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
          child: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = (!obscureText);
                if (obscureText) {
                  suffixIcon = FontAwesomeIcons.eyeSlash;
                } else {
                  suffixIcon = FontAwesomeIcons.eye;
                }
              });
            },
            child: Icon(
              suffixIcon,
              size: 20,
              color: const Color(0xFF37474F),
            ),
          ),
        ),
      ),
    );
  }
}
