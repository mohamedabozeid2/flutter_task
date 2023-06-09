import 'package:flutter/material.dart';

import '../utils/app_values.dart';

class CustomTextField extends StatelessWidget {
  final BuildContext? context;
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final bool isPassword;
  final String validation;
  final Color iconColor;
  final Color cursorColor;
  final Color fillColor;
  TextStyle? hintStyle;
  TextStyle? contentStyle;
  Widget? prefixIcon;
  Widget? prefixWidget;
  Color? borderColor;
  Color? suffixIconColor;
  double? paddingInside;
  IconData? suffixIcon;
  void Function()? sufIconFun;
  void Function(String)? onSubmitFunction;
  void Function(String)? onChangeFunction;
  double borderRadius;

  CustomTextField({
    super.key,
    required this.context,
    required this.controller,
    required this.type,
    required this.label,
    this.isPassword = false,
    this.validation = "",
    this.suffixIconColor = Colors.white,
    this.fillColor = Colors.transparent,
    this.iconColor = Colors.blue,
    this.cursorColor = Colors.blue,
    this.sufIconFun,
    this.onSubmitFunction,
    this.onChangeFunction,
    this.prefixWidget,
    this.borderColor = Colors.white,
    this.borderRadius = 0,
    this.paddingInside,
    this.prefixIcon,
    this.hintStyle,
    this.contentStyle,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      // maxLines: 1,
      cursorColor: cursorColor,
      obscureText: isPassword,
      validator: (String? value) {
        if (value!.isEmpty) {
          return validation;
        }
        return null;
      },
      style: contentStyle ??
          Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
      onChanged: onChangeFunction,
      onFieldSubmitted: onSubmitFunction,
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          hintText: label,
          hintStyle: hintStyle ??
              Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
          prefix: prefixWidget,
          prefixIcon: Padding(
            padding: EdgeInsets.all(AppSize.s8),
            child: prefixIcon ?? prefixIcon,
          ),
          suffixIcon: IconButton(
            onPressed: sufIconFun,
            icon: Icon(
                suffixIcon == null
                    ? suffixIcon = null
                    : suffixIcon = suffixIcon,
                color: suffixIconColor),
          ),
          contentPadding: paddingInside != null
              ? EdgeInsets.symmetric(vertical: paddingInside!)
              : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor!),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor!,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor!))),
    );
  }
}
