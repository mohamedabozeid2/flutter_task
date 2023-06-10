import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/components.dart';
import '../../../../../../../core/utils/constants.dart';

class CategoryItemBuilder extends StatelessWidget {
  final Widget navigationWidget;
  final String iconPath;
  final double defaultIconSize;

  const CategoryItemBuilder({
    super.key,
    required this.navigationWidget,
    required this.iconPath,
    required this.defaultIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Components.navigateTo(context, navigationWidget);
      },
      child: Container(
        padding: EdgeInsets.all(Constants.mainPadding + AppSize.s5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: AppColors.lightOrangeColor,
        ),
        child: Image.asset(
          iconPath,
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
