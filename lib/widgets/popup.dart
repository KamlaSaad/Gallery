import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/widgets/text_widget.dart';
import 'package:get/get.dart';
import '../utils/constants.dart';

void loadingMessage(String text){
  Get.defaultDialog(title: "",
    titleStyle: const TextStyle(fontSize: 0),
    backgroundColor: Constant.greyLight.withOpacity(0.5),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(text:text),
        SizedBox(height: 5.h,),
        const CircularProgressIndicator()
      ],
    )
  );
}
