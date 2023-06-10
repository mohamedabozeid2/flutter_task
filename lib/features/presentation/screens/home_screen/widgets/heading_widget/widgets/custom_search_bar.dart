import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_icons.dart';
import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/constants.dart';
import '../../../../../../../core/utils/strings.dart';

class CustomSearchBar extends StatelessWidget {
  final double defaultIconSize;

  const CustomSearchBar({
    super.key,
    required this.defaultIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Constants.mainPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: Row(
        children: [
          Icon(
            AppIcons.searchIcon,
            size: defaultIconSize,
          ),
          SizedBox(
            width: AppSize.s10,
          ),
          Expanded(
            child: Text(
              AppStrings.searchProducts,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!,
            ),
          )
        ],
      ),
    );
  }
}
