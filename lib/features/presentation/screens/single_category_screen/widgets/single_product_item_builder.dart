import 'package:flutter/material.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/cached_image.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../domain/entities/product.dart';
import '../../product_screen/product_screen.dart';

class SingleProductItemBuilder extends StatelessWidget {
  final Product product;

  const SingleProductItemBuilder({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Components.navigateTo(
            context,
            ProductScreen(
              product: product,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(AppSize.s15),
        height: Helper.getMaxHeight() * 0.22,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.s15)),
        child: Row(
          children: [
            CachedImage(
              image: product.image,
              height: Helper.getMaxHeight() * 0.2,
              width: Helper.getMaxWidth() * 0.4,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: AppSize.s15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: Text(
                      product.description,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CustomButton(
                      fun: () {
                        Components.navigateTo(
                            context,
                            ProductScreen(
                              product: product,
                            ));
                      },
                      text: AppStrings.details,
                      height: AppSize.s40,
                      backgroundColor: AppColors.mainColor,
                      textColor: Colors.white,
                      fontSize: AppFontSize.s18)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
