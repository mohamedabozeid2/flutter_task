import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_icons.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../../core/widgets/cached_image.dart';
import '../../../../../domain/entities/product.dart';
import 'widgets/heading_icon.dart';

class ProductImageWidget extends StatelessWidget {
  final Product product;

  const ProductImageWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Helper.getMaxHeight() * 0.08,
        left: Helper.getMaxWidth() * 0.05,
        right: Helper.getMaxWidth() * 0.05,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductHeadingIcon(
                content: Icon(AppIcons.arrowBack),
                fun: () {
                  Navigator.pop(context);
                },
              ),
              ProductHeadingIcon(
                  content: Row(
                    children: [
                      Text(
                        product.rate,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Icon(
                        AppIcons.starIcon,
                      )
                    ],
                  ),
                  fun: () {})
            ],
          ),
          CachedImage(
              image: product.image,
              height: Helper.getMaxHeight() * 0.3,
              fit: BoxFit.contain,
              width: Helper.getMaxWidth()),

        ],
      ),
    );
  }
}
