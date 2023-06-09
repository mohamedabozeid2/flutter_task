import 'package:flutter/material.dart';

class Helper {
  static late double _maxHeight;
  static late double _maxWidth;

  static void setMaxHeight({required double maxHeight}) => _maxHeight = maxHeight;

  static double getMaxHeight() => _maxHeight;

  static void setMaxWidth({required double maxWidth}) => _maxWidth = maxWidth;

  static double getMaxWidth() => _maxWidth;

  static double getPaddingTop({required BuildContext context}) {
    return MediaQuery.of(context).viewPadding.top;
  }

  static double getPaddingBot({required BuildContext context}) {
    return MediaQuery.of(context).viewPadding.bottom;
  }

  static double getPaddingLeft({required BuildContext context}) {
    return MediaQuery.of(context).viewPadding.left;
  }

  static double getPaddingRight({required BuildContext context}) {
    return MediaQuery.of(context).viewPadding.right;
  }
}
