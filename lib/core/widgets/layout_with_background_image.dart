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
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: Helper.getMaxHeight(),
                width: Helper.getMaxWidth(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsManager.loginWallpaper),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                width: Helper.getMaxWidth(),
                padding: EdgeInsets.all(AppSize.s20),
                margin: EdgeInsets.all(AppSize.s15),
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(AppSize.s20)),
                child: Center(
                  child: frontWidget,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
