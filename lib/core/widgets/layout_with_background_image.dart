import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/helper.dart';
import '../utils/app_values.dart';

class LayoutWithBackgroundImage extends StatelessWidget {
  final Widget frontWidget;

  const LayoutWithBackgroundImage({
    super.key,
    required this.frontWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Helper.getMaxHeight(),
        width: Helper.getMaxWidth(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.loginWallpaper),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: frontWidget,
          ),
        ));
  }
}
