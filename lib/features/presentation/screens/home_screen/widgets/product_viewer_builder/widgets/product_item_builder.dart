import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/components.dart';
import '../../../../../../../core/utils/helper.dart';
import '../../../../../../../core/widgets/cached_image.dart';
import '../../../../../../domain/entities/product.dart';
import '../../../../product_screen/product_screen.dart';

class ProductItemBuilder extends StatelessWidget {
  final Product product;
  final double productWidth;

  const ProductItemBuilder({
    super.key,
    required this.productWidth,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Components.navigateTo(context, ProductScreen(product: product));
      },
      child: Padding(
        padding: EdgeInsets.all(AppSize.s20),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20),
            color: Colors.white,

          ),
          child: CachedImage(
            image: product.image,
            fit: BoxFit.contain,
            height: Helper.getMaxHeight() * 0.15,
            width: productWidth,
          ),
        ),
      ),
    );
  }
}
