import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_values.dart';
import 'strings.dart';

class Components {
  static String getOS() {
    return Platform.operatingSystem;
  }

  static showSnackBar({
    required String message,
    int durationWithMilliSeconds = 2000,
    required Color textColor,
  }) {
    Get.snackbar(
      AppStrings.appName,
      message,
      margin:
          EdgeInsets.symmetric(vertical: AppSize.s30, horizontal: AppSize.s10),
      backgroundColor: Colors.transparent.withOpacity(0.5),
      colorText: textColor,
      animationDuration: const Duration(
        milliseconds: 500,
      ),
      duration: Duration(milliseconds: durationWithMilliSeconds),
    );
  }

  static navigateAndFinish({required context, required widget}) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  static navigateTo(context, widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

// static slideNavigateTo(context, page) {
//   Navigator.of(context).push(SlideAnimationNav(page: page, context: context));
// }
//
// static scaleNavigateTo(context, page) {
//   Navigator.of(context).push(ScaleAnimationNav(page: page, context: context));
// }
//
// static rotationNavigateTo(context, page) {
//   Navigator.of(context)
//       .push(RotationAnimationNav(page: page, context: context));
// }
//
// static sizeNavigateTo(context, page) {
//   Navigator.of(context).push(SizeAnimationNav(page: page, context: context));
// }
//
// static opacityNavigateTo(context, page) {
//   Navigator.of(context)
//       .push(OpacityAnimationNav(page: page, context: context));
// }
}
