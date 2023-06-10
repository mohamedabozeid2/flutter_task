

import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/helper.dart';
import '../../../../../../../core/widgets/cached_image.dart';
import '../../../../../../domain/entities/product.dart';

class ProductItemBuilder extends StatelessWidget {
  final Product product;

  const ProductItemBuilder({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: EdgeInsets.all(AppSize.s20),
        child: CachedImage(
            image: product.image,
            height: Helper.getMaxHeight() * 0.15,
            width: Helper.getMaxWidth() * 0.3),
      ),
    );
  }
}
