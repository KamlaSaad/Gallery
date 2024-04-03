import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/widgets/scroll_text.dart';

class UploadButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double? width;
  final double? height;
  final List<Color> colors;
  final Function tap;
  const UploadButton({Key? key, required this.text, required this.icon,
    required this.colors, this.width, this.height,required this.tap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>tap(),
      child: Container(
        width: width??145.w,
        height: height??45.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: ListTile(
          horizontalTitleGap: 0,
          leading: Container(
            width: 32.w,
            height: 28.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: RadialGradient(
                center: const Alignment(0.82, 0.43),
                radius: 1.r,
                colors: colors,
                stops: const [0.0, 1.0],
              ),
              boxShadow: [BoxShadow(color: colors[0].withOpacity(0.6),blurRadius: 5.r,spreadRadius: 1.5)]
            ),
            child: Icon(icon,color: Colors.white,size: 21.w,),
          ),
          title: ScrollText(
            width: 0,
            text: text,
            size: 20.sp,
            centerText: true,
            fontFamily: "baloo",
          ),
        ),
      ),
    );
  }
}
