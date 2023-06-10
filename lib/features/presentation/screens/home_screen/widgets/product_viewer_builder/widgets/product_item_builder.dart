import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/helper.dart';
import '../../../../../../../core/widgets/cached_image.dart';
import '../../../../../../domain/entities/product.dart';

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
      onTap: () {},
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
