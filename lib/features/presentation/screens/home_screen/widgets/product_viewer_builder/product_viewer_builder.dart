import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_values.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../../domain/entities/product.dart';
import '../../../../controller/home_cubit/home_cubit.dart';
import 'widgets/product_item_builder.dart';
import 'widgets/product_title.dart';

class ProductViewerBuilder extends StatefulWidget {
  const ProductViewerBuilder({super.key});

  @override
  State<ProductViewerBuilder> createState() => _ProductViewerBuilderState();
}

class _ProductViewerBuilderState extends State<ProductViewerBuilder> {
  final double productItemWidth = Helper.getMaxWidth() * 0.3;
  final double productItemPadding = AppSize.s20;
  final double productDividerWidth = AppSize.s15;
  final double productViewerHeight = Helper.getMaxHeight() * 0.25;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    List<Product> allProducts = HomeCubit.get(context).allProducts;
    return Column(
      children: [
        const ProductTitle(),
        SizedBox(
          height: productViewerHeight,
          child: Row(
            children: [
              Expanded(
                child: NotificationListener<ScrollUpdateNotification>(
                  onNotification: (value) {
                    setState(() {});
                    return true;
                  },
                  child: ListView.separated(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final double itemPosition =
                            index * calculateItemWidth();
                        final double difference =
                            scrollController.offset - itemPosition;
                        final double percent =
                            1 - (difference / calculateItemWidth());
                        double opacity = percent;
                        if (opacity > 1.0) opacity = 1.0;
                        if (opacity < 0.0) opacity = 0.0;
                        double scale = percent;
                        if (scale > 1.0) scale = 1.0;
                        if (scale < 0.0) scale = 0.0;
                        return Opacity(
                          opacity: opacity,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scale(scale + 0.1, scale + 0.1),
                            child: ProductItemBuilder(
                              product: allProducts[index],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: AppSize.s15);
                      },
                      itemCount: allProducts.length),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double calculateItemWidth() {
    return productItemWidth + productDividerWidth + productItemPadding * 2;
  }
}
