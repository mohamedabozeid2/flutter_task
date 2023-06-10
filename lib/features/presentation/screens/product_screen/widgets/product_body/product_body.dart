import 'package:flutter/material.dart';

import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../core/utils/app_values.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../../core/utils/strings.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../domain/entities/product.dart';
import 'widgets/add_favorite_button.dart';
import 'widgets/product_body_title.dart';

class ProductBody extends StatelessWidget {
  final Product product;

  const ProductBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.coolGreyColor.withOpacity(0.6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s40),
            topRight: Radius.circular(AppSize.s40),
          )),
      child: Column(
        children: [
          ProductBodyTitle(title: product.title),
          const AddFavoriteButton(),
          Padding(
            padding: EdgeInsets.all(AppSize.s15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    product.description,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s15,
          ),
          Text(
            "${AppStrings.price}: ${product.price}\$",
            style: Theme.of(context).textTheme.bodyMedium,
          ),SizedBox(
            height: AppSize.s15,
          ),
          CustomButton(
            fun: () {},
            text: AppStrings.addToCart,
            height: AppSize.s70,
            fontSize: AppFontSize.s30,
            textColor: Colors.white,
            backgroundColor: AppColors.mainColor,
            width: Helper.getMaxWidth() * 0.8,
            borderRadius: AppSize.s20,
          ),
          SizedBox(
            height: AppSize.s30,
          )
        ],
      ),
    );
  }
}
