import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/Colors.dart';
import 'package:flutter_task/core/utils/app_values.dart';
import 'package:flutter_task/core/utils/constants.dart';
import 'package:flutter_task/features/domain/entities/product.dart';
import 'package:flutter_task/features/presentation/screens/single_category_screen/widgets/single_product_item_builder.dart';

import '../../controller/home_cubit/home_cubit.dart';

class SingleCategoryScreen extends StatefulWidget {
  final String category;

  const SingleCategoryScreen({
    super.key,
    required this.category,
  });

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getSingleCategoryProducts(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> productsList = HomeCubit.get(context).singleCategoryProducts;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        color: AppColors.coolGreyColor,
        child: Padding(
          padding: EdgeInsets.all(Constants.mainPadding),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SingleProductItemBuilder(product: productsList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: AppSize.s15,
                    );
                  },
                  itemCount: productsList.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
