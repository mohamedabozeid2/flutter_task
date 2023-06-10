import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/helper.dart';
import '../../../domain/entities/product.dart';
import 'widgets/product_body/product_body.dart';
import 'widgets/product_image/product_image.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          // height: Helper.getMaxHeight(),
          width: Helper.getMaxWidth(),
          child: Column(
            children: [
              ProductImageWidget(product: product),
              SizedBox(
                height: AppSize.s15,
              ),
              ProductBody(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
