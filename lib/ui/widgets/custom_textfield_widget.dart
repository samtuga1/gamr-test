import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamr/data/data.dart';
import 'package:gamr/utils/utils.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue, prefixText, suffixText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int? minLines;
  final bool readOnly, addHint, enabled, obscureText;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onTap;
  final AutovalidateMode autoValidateMode;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor, textColor;
  final Color? borderColor;
  final double? borderRadius, fontSize;
  final String? enteredText;
  final bool expands;
  final InputBorder? focusedBorder, enabledBorder, border;
  final FocusNode? focusNode;
  final Function(PointerDownEvent event)? onTapOutside;

  const CustomTextFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator = Validators.validateEmpty,
    this.onChanged,
    this.onSaved,
    this.textColor,
    this.maxLength,
    this.maxLines,
    this.obscureText = false,
    this.minLines = 1,
    this.initialValue,
    this.readOnly = false,
    this.onTap,
    this.onTapOutside,
    this.enabled = true,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.addHint = false,
    this.suffixIconConstraints,
    this.prefixText,
    this.suffixText,
    this.isDense = true,
    this.contentPadding,
    this.prefixIconPadding,
    this.fillColor = AppColors.tinyGrey,
    this.borderColor = AppColors.greyX,
    this.enteredText,
    this.borderRadius,
    this.expands = false,
    this.focusedBorder,
    this.enabledBorder,
    this.border,
    this.focusNode,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyles.regular.copyWith();
    return TextFormField(
      onTapOutside: onTapOutside ??
          (_) {
            FocusScope.of(context).unfocus();
          },
      focusNode: focusNode,
      textAlign: TextAlign.start,
      style: textStyle,
      expands: expands,
      onTap: onTap,
      readOnly: readOnly,
      initialValue: initialValue,
      keyboardType: keyboardType,
      autovalidateMode: autoValidateMode,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      onSaved: onSaved,
      enabled: enabled,
      inputFormatters: maxLength == null
          ? null
          : [
              LengthLimitingTextInputFormatter(maxLength),
              if (keyboardType == TextInputType.number)
                FilteringTextInputFormatter.digitsOnly,
            ],
      decoration: InputDecoration(
        counterText:
            enteredText == null ? null : '${enteredText!.length}/$maxLength',
        counterStyle: textStyle,
        errorStyle: textStyle.copyWith(
          color: AppColors.red,
        ),
        fillColor: fillColor,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        filled: fillColor != null,
        isDense: isDense,
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              // borderSide: const BorderSide(color: AppColors.kPrimaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 5),
              ),
            ),
        disabledBorder: OutlineInputBorder(
            // borderSide:
            //     BorderSide(color: borderColor ?? AppColors.kPrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5))),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                // borderSide: const BorderSide(color: AppColors.transparent),
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5))),
        border: border ??
            OutlineInputBorder(
                // borderSide:
                //     BorderSide(color: borderColor ?? AppColors.kPrimaryColor),
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 5))),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5))),
        labelText: addHint
            ? null
            : ((controller?.text != null || !readOnly) ? labelText : null),
        hintText: hintText,
        hintStyle: AppTextStyles.regular.copyWith(
          height: 1,
          fontSize: fontSize,
          overflow: TextOverflow.visible,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 40.h,
          maxWidth: 40.w,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: prefixIconPadding ??
                    EdgeInsets.only(left: 10.w, right: 8.w),
                child: prefixIcon,
              ),
        prefixText: prefixText,
        suffixText: suffixText,
        prefixStyle: textStyle,
        suffixStyle: textStyle,
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: suffixIcon,
              ),
        suffixIconConstraints: suffixIconConstraints ??
            BoxConstraints(
              maxHeight: 40.h,
              maxWidth: 40.w,
            ),
      ),
    );
  }
}
