import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/widgets/scroll_text.dart';
import '../utils/constants.dart';

class MainButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? radius;
  final bool? loading;
  final Function click;
  const MainButton(
      {Key? key,
      required this.text,
      this.fontSize,
      this.color,
      this.textColor,
      this.width,
      this.height,
      this.radius,
      this.loading,
      required this.click,
      this.borderColor,
      this.borderWidth,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = width ?? 282.w;
    return GestureDetector(
      onTap: () {
        if (loading != true) {
          click();
        }
      },
      child: Container(
        width: w,
        height: height ?? 46.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: color ?? Constant.blueLight,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        child: ScrollText(
          text: loading == true ? "Loading.." : text,
          color: textColor ?? Colors.white,
          size: fontSize ?? 18.sp,
          width: w * 0.95,
          weight: FontWeight.bold,
          centerText: true,
        ),
      ),
    );
  }
}
