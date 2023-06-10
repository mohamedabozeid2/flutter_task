import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../../core/utils/strings.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.s15),
      decoration: BoxDecoration(
          color: AppColors.coolGreyColor,
          borderRadius: BorderRadius.circular(AppSize.s15)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.allProducts,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }
}
