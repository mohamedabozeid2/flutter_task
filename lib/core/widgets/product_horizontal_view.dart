import 'package:flutter/material.dart';

import '../../features/domain/entities/product.dart';
import '../utils/app_fonts.dart';
import '../utils/app_values.dart';
import '../utils/colors.dart';
import '../utils/helper.dart';
import 'cached_image.dart';

class ProductHorizontalView extends StatelessWidget {
  final Product product;
  final IconData functionIcon;
  final VoidCallback fun;

  const ProductHorizontalView({
    super.key,
    required this.product,
    required this.fun,
    required this.functionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Helper.getMaxHeight() * 0.18,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSize.s15),
            margin: EdgeInsets.all(AppSize.s15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.s15)),
            child: CachedImage(
              image: product.image,
              height: Helper.getMaxHeight() * 0.1,
              width: Helper.getMaxWidth() * 0.2,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: AppSize.s15),
            width: Helper.getMaxWidth() * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${double.parse(product.price).round().toString()}\$',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.deepOrange),
                    ),
                    GestureDetector(
                      onTap: fun,
                      child: Container(
                          padding: EdgeInsets.all(AppSize.s10),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(AppSize.s15)),
                          child: Icon(
                            functionIcon,
                            color: Colors.white,
                            size: AppFontSize.s24,
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
