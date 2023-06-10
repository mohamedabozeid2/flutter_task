import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/Colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/adaptive_indicator.dart';
import '../../../domain/entities/product.dart';
import '../../controller/home_cubit/home_cubit.dart';
import '../../controller/home_cubit/home_states.dart';
import 'widgets/single_product_item_builder.dart';

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
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(AppIcons.arrowBack),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        buildWhen: (previous, current) =>
            current is HomeGetSingleCategoryProductsLoadingStates ||
            current is HomeGetSingleCategoryProductsSuccessStates ||
            current is HomeGetSingleCategoryProductsErrorStates,
        listener: (context, state) {},
        builder: (context, state) {
          return state is HomeGetSingleCategoryProductsLoadingStates
              ? Center(
                  child: AdaptiveIndicator(
                    os: Components.getOS(),
                    color: AppColors.mainColor,
                  ),
                )
              : Container(
                  color: AppColors.coolGreyColor,
                  child: Padding(
                    padding: EdgeInsets.all(Constants.mainPadding),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SingleProductItemBuilder(
                                  product: productsList[index]);
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
                );
        },
      ),
    );
  }
}
