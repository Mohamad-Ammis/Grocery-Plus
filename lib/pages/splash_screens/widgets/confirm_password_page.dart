import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task7_store_app/pages/home_page.dart';
import '../../../controllers/splash_controller.dart';
import 'custom_pass_text_field.dart';
import 'custom_splash_button.dart';
import 'custom_splash_info.dart';

class ConfirmPasswordPage extends StatelessWidget {
  ConfirmPasswordPage({super.key});
  final splashController=Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height+50,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        splashController.pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
                      }, icon: const Icon(Icons.arrow_back_ios)),
                  const Text(
                    "Choose a Password",
                    style: TextStyle(
                        color: Color.fromARGB(255, 31, 25, 25),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  const Text(""),
                  const Text("")
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomSplashInfo(title: '', subTitle: 'For the security & safety please choose a password'),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/splash_three.png'),
              const SizedBox(height: 30,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ),const SizedBox(height: 20,)

                    ,CustomPasswordTextField(
                      textStyle: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      label: null,
                      labelStyle: null,
                      filled: true,
                      fillColor: const Color(0xFFF0F1F2),
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.lock,
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: const Color(0xFF37474F).withOpacity(0.72)),
                    ),
                    const Expanded(child: SizedBox()),
                     CustomSplashButton(text: 'Finish, Good to go',ontap:(){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                      return HomePage();
                    }),(route) =>false,);
                    },),
                    const SizedBox(height: 20,)
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
