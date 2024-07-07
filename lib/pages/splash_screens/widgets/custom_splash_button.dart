
import 'package:flutter/material.dart';

class CustomSplashButton extends StatelessWidget {
  const CustomSplashButton({
    super.key,  this.text='Next', this.ontap, this.suffixIcon=Icons.arrow_forward_outlined, this.backgroundColor=const Color(0xFF5EC401),
  });
  final String? text;
  final void Function()? ontap;
  final IconData? suffixIcon;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(''),
            Text(text!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                )),
                Icon(suffixIcon,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}