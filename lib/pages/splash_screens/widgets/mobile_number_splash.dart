import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/splash_controller.dart';
import 'custom_pass_text_field.dart';
import 'custom_splash_button.dart';
import 'custom_splash_info.dart';
import 'custom_text_field.dart';

class MobileNumberSplash extends StatelessWidget {
  MobileNumberSplash({
    super.key,
  });
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).width / 5,
            ),
            Image.asset('assets/images/splash_one.png'),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomSplashInfo(
                      title: 'Enter your mobile number',
                      subTitle:
                          'We need to verify you. We will send you a one time verification code. ',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      textStyle: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      label: null,
                      labelStyle: null,
                      filled: true,
                      fillColor: const Color(0xFFF0F1F2),
                      suffixIcon: null,
                      prefixIcon: Icons.phone,
                      hintText: 'Phone',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: const Color(0xFF37474F).withOpacity(0.72)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomPasswordTextField(
                      textStyle: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      label: null,
                      labelStyle: null,
                      filled: true,
                      fillColor: const Color(0xFFF0F1F2),
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: const Color(0xFF37474F).withOpacity(0.72)),
                    ),
                    const Expanded(child: SizedBox()),
                    CustomSplashButton(
                      ontap: () {
                        splashController.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
