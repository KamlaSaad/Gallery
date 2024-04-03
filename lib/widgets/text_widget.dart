import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/utils/constants.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final double? lineHeight;
  final Color? color;
  final FontWeight? weight;
  final String? fontFamily;
  final bool? overflow;
  final bool? deleted;
  final bool? underline;
  final TextAlign? textAlign;

  const TextWidget({
    Key? key,
    required this.text,
    this.textAlign,
    this.size,
    this.color,
    this.weight,
    this.overflow,
    this.deleted, this.underline,
    this.lineHeight,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Constant.dark,
        fontSize: size ?? 18.sp,
        fontWeight: weight ?? FontWeight.w500,
        fontFamily: fontFamily??"segoe",
        height: lineHeight??1.h,
        decoration: deleted==true? TextDecoration.lineThrough:(underline==true? TextDecoration.underline:TextDecoration.none)
      ),
      overflow: overflow == true ? TextOverflow.ellipsis : TextOverflow.visible,
    );
  }
}


