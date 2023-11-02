import 'package:flutter/material.dart';
import 'package:gamr/data/data.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final int? maxLine;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final TextDecoration? textDecoration;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextStyle? style;

  const CustomText(
    this.text, {
    Key? key,
    this.color,
    this.textAlign,
    this.fontSize,
    this.maxLine,
    this.fontWeight,
    this.fontStyle,
    this.textStyle,
    this.textDecoration,
    this.softWrap,
    this.overflow,
    this.style,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = style == null
        ? AppTextStyles.regular.copyWith(
            decoration: textDecoration,
            color: color,
            fontSize: fontSize,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            overflow: overflow,
            fontFamily: 'Satoshi',
          )
        : style!.copyWith(
            decoration: textDecoration,
            color: color,
            fontSize: fontSize,
            fontStyle: fontStyle,
            fontWeight: fontWeight,
            overflow: overflow,
            fontFamily: 'Satoshi',
          );
    return Text(
      text,
      textAlign: textAlign,
      softWrap: softWrap ?? true,
      overflow: overflow,
      maxLines: maxLine,
      style: textStyle,
    );
  }
}
