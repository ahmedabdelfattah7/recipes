
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tadmon/core/utils/colors.dart';
import 'package:tadmon/core/utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  final TextEditingController? controller;
  final String obscuringCharacter;
  final String hint;
  final String label;
  final Color? filledColor;
  final bool enable;
  final Function()? onTap;
  final InputDecoration? decoration;
  final Function(String?) onSave;
  final Function(String?)? onChange;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int maxLines;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelTextStyle;
  final TextAlignVertical textAlignVertical;
  final Function()? onTapShowHidePassword;

  CustomTextFormField({
    Key? key,
    required this.hint,
    required this.onSave,
    required this.inputType,
    required this.label,
    this.textAlignVertical = TextAlignVertical.center,
    this.onChange,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.filledColor,
    this.maxLength,
    this.decoration,
    this.focusNode,
    this.maxLines = 1,
    this.obscuringCharacter = "*",
    this.inputFormatters,
    this.enable = true,
    this.onTap,
    this.onTapShowHidePassword,
    this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.labelTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          onSaved: (value) => onSave(value),
          onChanged: onChange,
          cursorColor: ColorCode.darkGrey,
          showCursor: true,
          onTap: onTap,
          enabled: enable,
          textAlign: TextAlign.start,
          keyboardType: inputType,
          maxLines: maxLines,
          focusNode: focusNode,
          inputFormatters: inputFormatters ?? [],
          textAlignVertical: textAlignVertical,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          textInputAction: textInputAction,
          maxLength: maxLength,
          style: TextStyles.textMedium.copyWith(
            color: ColorCode.darkGrey,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          decoration: decoration ??
              InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: hint,
                hintStyle: TextStyles.textMedium.copyWith(
                  color: ColorCode.darkGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 10.5,
                ),
                labelText: hint,
                errorStyle: TextStyle(height: 0.1, fontSize: 1),
                labelStyle: labelTextStyle ??
                    TextStyles.textXSmall.copyWith(
                        fontWeight: FontWeight.w500, color: ColorCode.darkGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: filledColor ?? ColorCode.lightGrey, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: filledColor ?? ColorCode.lightGrey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: filledColor ?? ColorCode.lightGrey, width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: ColorCode.lightGrey, width: 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: filledColor ?? ColorCode.lightGrey, width: 1),
                ),
                fillColor: filledColor ?? ColorCode.lightGrey,
                filled: true,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon ?? // Use provided suffixIcon or show/hide password logic
                    (onTapShowHidePassword != null
                        ? IconButton(
                      icon: obscureText
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                      onPressed: onTapShowHidePassword,
                    )
                        : null),
              ),
        ),
      ],
    );
  }
}
