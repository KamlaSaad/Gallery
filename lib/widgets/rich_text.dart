import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constants.dart';

class RichTextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  const RichTextWidget({Key? key, required this.text, this.size,
    this.color, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(text:TextSpan(
      text: text,
      style: TextStyle(
        color: color??Constant.dark,
        fontWeight: weight??FontWeight.w500,
        fontSize: size??22.sp)
     ), textAlign: TextAlign.center,
    );
  }
}
