import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/ui/widgets/widgets.dart';

class CustomAdaptiveTextButton extends StatelessWidget {
  const CustomAdaptiveTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.style,
    this.color,
  });
  final String text;
  final VoidCallback? onTap;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = style ??
        AppTextStyles.regularMini.copyWith(
          color: color,
        );
    return Platform.isIOS
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 10,
            onPressed: onTap,
            child: CustomText(
              text,
              style: style ?? textStyle,
            ),
          )
        : TextButton(
            onPressed: onTap,
            child: CustomText(
              text,
              style: style ?? textStyle,
            ),
          );
  }
}
