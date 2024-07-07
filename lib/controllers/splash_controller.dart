import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class SplashController extends GetxController{
  final pageController=PageController();
  File? image;
  pickImage() async {
    XFile? img= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(img!=null){
      File file=File(img.path);
      image= file;
      update();
    }
  }
}