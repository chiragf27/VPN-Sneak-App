import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogs{

  static success({required String msg}){
     Get.snackbar('Success', msg, 
     colorText: Colors.black54, 
     backgroundColor: Colors.green.withOpacity(.9));
  }

  static error({required String msg}){
     Get.snackbar('Error', msg, 
     colorText: Colors.black54, 
     backgroundColor: Colors.redAccent.withOpacity(.9));
  }

  static info({required String msg}){

    Get.snackbar('Information', msg, 
    colorText: Colors.black54, 
    backgroundColor: Colors.white.withOpacity(.9));

  }

}