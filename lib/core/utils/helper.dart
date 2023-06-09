import 'package:flutter/material.dart';

class Helper {
  static late double _maxHeight;
  static late double _maxWidth;

  void setMaxHeight({required double maxHeight}) => _maxHeight = maxHeight;

  double getMaxHeight() => _maxHeight;

  void setMaxWidth({required double maxWidth}) => _maxWidth = maxWidth;

  double getMaxWidth() => _maxWidth;

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
