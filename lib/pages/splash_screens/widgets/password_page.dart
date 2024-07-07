import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/splash_controller.dart';
import 'custom_pass_text_field.dart';
import 'custom_splash_button.dart';
import 'custom_splash_info.dart';

class PasswordPage extends StatelessWidget {
  PasswordPage({
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
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      splashController.pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/splash_two.png'),
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
                        title: 'Enter the password',
                        subTitle:
                            'It looks like you already have an account in this number. Please enter the password to proceed'),
                    const SizedBox(
                      height: 40,
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Color(0xFFF37A20)),
                    ),
                    const Expanded(child: SizedBox()),
                    CustomSplashButton(
                      text: 'Submit',
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
