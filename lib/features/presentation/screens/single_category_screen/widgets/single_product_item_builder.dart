import 'package:flutter/material.dart';

import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/widgets/cached_image.dart';
import '../../../../domain/entities/product.dart';

class SingleProductItemBuilder extends StatelessWidget {
  final Product product;

  const SingleProductItemBuilder({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.s15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s15)
      ),
      child: Row(
        children: [
          CachedImage(
            image: product.image,
            height: Helper.getMaxHeight() * 0.2,
            width: Helper.getMaxWidth() * 0.4,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
