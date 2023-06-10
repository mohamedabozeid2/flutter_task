
import 'package:flutter/material.dart';

import '../../../../../../../core/utils/Colors.dart';
import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/constants.dart';

class HeadingIconButton extends StatelessWidget {
  final double defaultIconSize;
  final IconData icon;

  const HeadingIconButton({
    super.key,
    required this.defaultIconSize,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        padding: EdgeInsets.all(Constants.mainPadding),
        decoration: BoxDecoration(
            color: AppColors.coolGreyColor,
            borderRadius: BorderRadius.circular(
              AppSize.s50,
            )),
        child: Icon(
          icon,
          size: defaultIconSize,
        ),
      ),
    );
  }
}
