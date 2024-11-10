import 'package:flutter/material.dart';
import 'package:uptm_secure_stay/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.enableBorder = true,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;
  final bool? enableBorder;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: TextFormField(
          controller: controller,
          // focusNode: focusNode ?? FocusNode(),
          // autofocus: autofocus!,
          style: textStyle ?? theme.textTheme.bodyLarge,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyLargeGray80016,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(16.h),
        fillColor:
            fillColor ?? theme.colorScheme.onPrimaryContainer.withOpacity(1),
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(
                  color: enableBorder! ? appTheme.black20 : Colors.transparent),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(
                color: ColorSchemes.primaryColorScheme.primary,
                width: 1,
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.redError,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.redError,
            width: 1,
          ),
        ),
        errorStyle: TextStyle(
          color: appTheme.errorText,
          fontSize: 16.fSize,
        ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineGrayTL16 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.h),
        borderSide: BorderSide(
          color: appTheme.gray300,
          width: 1,
        ),
      );
  static OutlineInputBorder get fillOnPrimaryContainerTL18 =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillOnPrimaryContainerTL16 =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.h),
        borderSide: BorderSide.none,
      );
}
