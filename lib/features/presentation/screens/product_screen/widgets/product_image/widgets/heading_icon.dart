import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/colors.dart';

class ProductHeadingIcon extends StatelessWidget {
  final Widget content;
  final VoidCallback fun;

  const ProductHeadingIcon({
    super.key,
    required this.content,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        padding: EdgeInsets.all(AppSize.s10),
        decoration: BoxDecoration(
          color: AppColors.coolGreyColor,
          borderRadius: BorderRadius.circular(AppSize.s50),
        ),
        child: content,
      ),
    );
  }
}
