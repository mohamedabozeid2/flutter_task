import 'package:flutter/material.dart';
import 'package:flutter_task/core/widgets/product_horizontal_view.dart';

import '../../../../../core/utils/app_icons.dart';
import '../../../../domain/entities/product.dart';
import '../../../controller/home_cubit/home_cubit.dart';

class CartItemBuilder extends StatelessWidget {
  final Product product;

  const CartItemBuilder({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ProductHorizontalView(
      product: product,
      fun: ()=>HomeCubit.get(context).removeFromCart(product: product),
      functionIcon: AppIcons.delete,
    );
  }
}
