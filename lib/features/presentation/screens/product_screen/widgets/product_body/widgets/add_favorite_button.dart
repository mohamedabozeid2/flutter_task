import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/components.dart';
import 'package:flutter_task/core/utils/strings.dart';
import 'package:flutter_task/features/presentation/controller/home_cubit/home_cubit.dart';

import '../../../../../../../core/utils/app_fonts.dart';
import '../../../../../../../core/utils/app_icons.dart';
import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/colors.dart';
import '../../../../../../domain/entities/product.dart';

class AddFavoriteButton extends StatelessWidget {
  final Product product;

  const AddFavoriteButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSize.s15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              HomeCubit.get(context).addToFavorite(newProduct: product);
              Components.showSnackBar(
                message: AppStrings.addedToFavorite,
                textColor: Colors.white,
              );
            },
            child: Container(
              padding: EdgeInsets.all(AppSize.s20),
              decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s20),
                    bottomLeft: Radius.circular(AppSize.s20),
                  )),
              child: Icon(
                AppIcons.favoriteIcon,
                size: AppFontSize.s24,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
