
import 'package:flutter/material.dart';

class CustomSplashInfo extends StatelessWidget {
  const CustomSplashInfo({
    super.key, required this.title, required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
      title,
      style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w500),
    ),
    const SizedBox(
      height: 10,
    ),
    Text(
      subTitle,
      style: TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: const Color(0xff37474F).withOpacity(0.72)),
    ),
      ],
    );
  }
}
