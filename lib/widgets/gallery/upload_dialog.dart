import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/utils/constants.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../text_widget.dart';

void uploadDialog({required Function upload}) {
  Get.dialog(
    barrierColor: Colors.transparent,
    Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 320.w,
            height: 250.h,
            decoration: BoxDecoration(
              color: Constant.greyLight.withOpacity(0.4),
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(2, (i) {
                return GestureDetector(
                  onTap: () {
                    upload(i == 0 ? ImageSource.gallery : ImageSource.camera);
                  },
                  child: Container(
                    width: 180.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        Image.asset("assets/imgs/gallery$i.png",),
                        // SizedBox(width: 3.w,),
                        Expanded(
                          child: Center(
                            child: TextWidget(
                              text: i == 0 ? "Gallery" : "Camera",
                              size: 23.sp,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    ),
  );
}