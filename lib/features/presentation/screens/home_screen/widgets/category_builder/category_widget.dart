import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_values.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../controller/home_cubit/home_cubit.dart';
import '../../../single_category_screen/single_category_screen.dart';
import 'widgets/category_item_builder.dart';

class CategoryWidget extends StatelessWidget {
  final double defaultIconSize;

  const CategoryWidget({
    super.key,
    required this.defaultIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.getMaxHeight() * 0.08,
      margin: EdgeInsets.only(bottom: AppSize.s30),
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String category = HomeCubit.get(context).categories[index];
                  return CategoryItemBuilder(
                      navigationWidget: SingleCategoryScreen(
                        category: category,
                      ),
                      iconPath: iconPath(category: category),
                      defaultIconSize: defaultIconSize);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: Constants.mainPadding,
                  );
                },
                itemCount: HomeCubit.get(context).categories.length),
          )
        ],
      ),
    );
  }

  String iconPath({required String category}) {
    if (category == "electronics") {
      return AssetsManager.electronicsIcon;
    } else if (category == "jewelery") {
      return AssetsManager.jewelleryIcon;
    } else if (category == 'men\'s clothing') {
      return AssetsManager.menIcon;
    } else {
      return AssetsManager.womanIcon;
    }
  }
}
