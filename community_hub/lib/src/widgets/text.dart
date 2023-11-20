import 'package:community_hub/src/res/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? lineHeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final int? maxLines;

  const KText(
    this.text, {
    Key? key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.lineHeight,
    this.textAlign,
    this.decoration,
    this.overflow,this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,maxLines: maxLines,
      style: AppStyles.textStyle.copyWith(
        decoration: decoration,
        fontSize: fontSize ?? 18.sp,
        fontWeight: fontWeight /*?? FontWeight.w300*/,
        color: color,
        height: lineHeight,
      ),
    );
  }
}
