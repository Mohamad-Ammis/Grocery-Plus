import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import '../../../controllers/splash_controller.dart';
import 'custom_splash_button.dart';
import 'custom_splash_info.dart';
import 'custom_text_field.dart';

class InformationPage extends StatelessWidget {
  InformationPage({super.key});
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        // leading: IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: (){
        //   splashController.pageController.previousPage(duration:Duration(milliseconds: 500), curve: Curves.linear);
        // },),
        title:const  Text(
          "Your Information",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height-86,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const CustomSplashInfo(
                    title: '',
                    subTitle:
                        'It looks like you don’t have account in this number. Please let us know some information for a scure service'),
                const SizedBox(
                  height: 20,
                ),
                const CustomImageAvatar(),
                const SizedBox(
                  height: 20,
                ),
                const CustomSplashButton(
                  backgroundColor: Color(0xFF236CD9),
                  text: 'Sync From Facebook',
                  suffixIcon: FontAwesomeIcons.facebook,
                ),
                const SizedBox(height: 20,),
                CustomTextField(
                  textStyle: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  label: null,
                  labelStyle: null,
                  filled: true,
                  fillColor: const Color(0xFFF0F1F2),
                  suffixIcon: null,
                  prefixIcon: Icons.person,
                  hintText: 'Full Name',
                  hintStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: const Color(0xFF37474F).withOpacity(0.72)),
                ),
                const Expanded(child: SizedBox())
                ,CustomSplashButton(
                  ontap: (){
                     splashController.pageController.nextPage(duration:const Duration(milliseconds: 500), curve: Curves.linear);
                  },
                ),
                const SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomImageAvatar extends StatelessWidget {
  const CustomImageAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (splashController) {
        return GestureDetector(
          onTap:()async {
            await splashController.pickImage();
          }
          ,
          child: CircleAvatar(
            backgroundImage:splashController.image!=null?FileImage(splashController.image!):null,
            backgroundColor: const Color(0xFF37474F).withOpacity(0.14),
            radius: 60,
            child:splashController.image==null? const Image(image: AssetImage("assets/images/camera.png"),):null,
          ),
        );
      }
    );
  }
}
