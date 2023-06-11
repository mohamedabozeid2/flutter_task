import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/constants.dart';

class HeadingIconButton extends StatelessWidget {
  final double defaultIconSize;
  final IconData icon;
  final VoidCallback fun;

  const HeadingIconButton({
    super.key,
    required this.defaultIconSize,
    required this.icon,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        padding: EdgeInsets.all(Constants.mainPadding),
        decoration: BoxDecoration(
            color: Colors.white,
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
