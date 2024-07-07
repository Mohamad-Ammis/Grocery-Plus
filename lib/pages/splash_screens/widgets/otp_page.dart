import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../controllers/splash_controller.dart';
import 'custom_splash_button.dart';
import 'custom_splash_info.dart';

class OtpPage extends StatelessWidget {
  OtpPage({super.key});
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomSplashInfo(
                          title: "Enter Verification Code",
                          subTitle: 'We have sent SMS to:'),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "01XXXXXXXXXX",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const CustomOtpField(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Resend Otp?',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                color: Color(0xFFF37A20)),
                          ),
                          GestureDetector(
                            onTap: () {
                              splashController.pageController.jumpToPage(0);
                            },
                            child: Text(
                              'Change Phone Number',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: const Color(0xFF37474F).withOpacity(0.72)),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 5,
      fieldWidth: 56,
      fieldHeight: 56,
      borderRadius: BorderRadius.circular(8),
      filled: true,
      fillColor: const Color(0xFFF0F1F2),
      borderWidth: 0,
      borderColor: Colors.transparent,
      enabledBorderColor: Colors.transparent,
      focusedBorderColor: Colors.transparent,
      disabledBorderColor: Colors.transparent,

      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {}, // end onSubmit
    );
  }
}
