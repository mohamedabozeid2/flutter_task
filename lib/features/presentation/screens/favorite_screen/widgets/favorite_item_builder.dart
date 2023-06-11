import 'package:flutter/material.dart';

import '../../../../../core/widgets/product_horizontal_view.dart';
import '../../../../domain/entities/product.dart';

class FavoriteItemBuilder extends StatelessWidget {
  final Product product;
  final VoidCallback fun;
  final IconData functionIcon;

  const FavoriteItemBuilder({
    super.key,
    required this.product,
    required this.fun,
    required this.functionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ProductHorizontalView(
        product: product, fun: fun, functionIcon: functionIcon);
  }
}
