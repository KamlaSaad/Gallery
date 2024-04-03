import 'package:flutter/material.dart';
import 'package:gallery/widgets/text_widget.dart';

class ScrollText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final bool? centerText;
  final bool? reverseAlign;
  final bool? verticalScroll;
  final double width;
  final double? size;
  final double? lineHeight;
  final Color? color;
  final FontWeight? weight;
  const ScrollText({Key? key,required this.width,required this.text,
    this.centerText,this.size,this.color,this.weight,this.fontFamily,
    this.verticalScroll, this.reverseAlign, this.lineHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: width,
      alignment: centerText==true?Alignment.center:Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: verticalScroll==true?Axis.vertical:Axis.horizontal,
        child: TextWidget(
          text: text,color: color,size: size,weight: weight,lineHeight: lineHeight,fontFamily: fontFamily,),
      ),
    );
  }
}
