import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/utils/constants.dart';

class Input extends StatelessWidget {
  final String? hint;
  final Color? textColor;
  final TextEditingController controller;
  final bool? pass;
  final TextInputType? type;
  final bool? centerText;
  final double? width;
  final double? height;
  final int? length;
  final int? lines;
  final bool? readOnly;
  final Color? backgroundColor;
  final double? borderRadius;

  const Input({
    Key? key,
    this.hint,
    required this.controller,
    this.pass,
    this.type,
    this.width,
    this.height,
    this.length,
    this.readOnly,
    this.textColor,
    this.centerText,
    this.backgroundColor,
    this.lines,
    this.borderRadius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myHeight=height??46.h;
    final border=OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(borderRadius??(myHeight/2)),
    );
    return SizedBox(
      width: width??282.w,
      height: myHeight,
      child: TextFormField(
        obscuringCharacter: "*",
        controller: controller, obscureText: pass ?? false,
        keyboardType: type ?? TextInputType.text,
        textAlign: centerText == true?TextAlign.center:TextAlign.left,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontFamily: "font",
          fontSize: 18.sp,
          fontWeight: FontWeight.w500),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor??const Color(0xffF7F7F7),
          hintText: hint,
          hintStyle: TextStyle(
            color: Constant.grey,
            fontFamily: "font",fontSize: 16.sp,
            fontWeight: FontWeight.w500),
          counterText: "",
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
        ),
        maxLength: length ?? 500,
        minLines: lines??1,
        maxLines: lines!=null?(lines!+1):1,
        readOnly: readOnly??false,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
