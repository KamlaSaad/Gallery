import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void snackBar({required String msg,Color? bgColor,Color? textColor}){
  Get.snackbar("", "",
    titleText: const TextWidget(text: "",size: 0,),
    padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
    messageText: TextWidget(text: msg,color: Colors.white,size: 18.sp,weight: FontWeight.w500,),
    backgroundColor: bgColor??Colors.red,
    duration: const Duration(seconds: 8),
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.TOP,
    maxWidth: Get.width*0.9,
    margin: EdgeInsets.only(top: 60.h,right: 5.w),
    borderRadius: 0,
  );
}