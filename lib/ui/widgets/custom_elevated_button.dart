import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/ui/widgets/widgets.dart';

class CustomElevatedButton extends StatelessWidget {
  /// Provide either title or titleWidget
  final String? title;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  /// Provide either title or titleWidget
  final Widget? titleWidget;
  final Color? buttonColor, buttonBorderColor;
  final Color? textColor;
  final bool addBorder;
  final bool isBusy;
  final bool? isValidated;
  final double? borderRadius;
  final EdgeInsets? padding;

  const CustomElevatedButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.textStyle,
    this.borderRadius,
    this.buttonColor,
    this.buttonBorderColor,
    this.textColor,
    this.padding,
    this.titleWidget,
    this.addBorder = false,
    this.isBusy = false,
    this.isValidated = true,
  })  : assert(
          title == null || titleWidget == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "titleWidget: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return StatefulBuilder(builder: (ctx, setState) {
        // check if its light mode
        Color buttonColor = AppColors.buttonColor;
        return GestureDetector(
          onTap: (isValidated! && isBusy == false) ? onPressed : null,
          onTapDown: (tapDetails) {
            setState(() {
              buttonColor = AppColors.white.withOpacity(0.5);
            });
          },
          onTapCancel: () {
            setState(() {
              buttonColor = AppColors.buttonColor;
            });
          },
          child: CupertinoButton(
            color: buttonColor,
            padding: padding ?? const EdgeInsets.symmetric(vertical: 11.5),
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            onPressed: (isValidated! && isBusy == false) ? onPressed : null,
            disabledColor: buttonColor.withOpacity(0.5),
            child: !isBusy
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      titleWidget ??
                          CustomText(
                            title!,
                          ),
                    ],
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: CustomLoading(
                      height: 15,
                      width: 15,
                      color: AppColors.white,
                    ),
                  ),
          ),
        );
      });
    }
    return ElevatedButton(
      onPressed: isValidated! && !isBusy ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        disabledBackgroundColor: buttonColor?.withOpacity(0.5) ??
            AppColors.buttonColor.withOpacity(0.5),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 11.5),
        shape: addBorder
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    borderRadius == null ? 4 : borderRadius! + 5),
                side: const BorderSide(
                  width: 1.2,
                ),
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
              ),
        backgroundColor: buttonColor ?? AppColors.buttonColor,
      ),
      child: SizedBox(
        height: 22,
        child: !isBusy
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  titleWidget ??
                      CustomText(
                        title!,
                      ),
                ],
              )
            : const CustomLoading(
                height: 15,
                width: 15,
                color: AppColors.white,
              ),
      ),
    );
  }
}
