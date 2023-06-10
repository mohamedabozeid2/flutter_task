import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/Colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/app_values.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/adaptive_indicator.dart';
import '../../../../core/widgets/divider.dart';
import '../../controller/home_cubit/home_cubit.dart';
import '../../controller/home_cubit/home_states.dart';
import '../no_internet_screen/no_internet_screen.dart';
import 'widgets/category_builder/category_widget.dart';
import 'widgets/heading_widget/heading_widget.dart';
import 'widgets/offers_widget/models/offer_model.dart';
import 'widgets/offers_widget/offer_widget.dart';
import 'widgets/product_viewer_builder/product_viewer_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OfferModel currentOffer = OfferModel(
      offerTitle: "A Summer Surprise",
      offerBody: "Cashback 20%",
    );
    final double defaultIconSize = AppFontSize.s20;

    return BlocConsumer<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          current is HomeGetAllProductsLoadingStates ||
          current is HomeGetAllProductsSuccessStates ||
          current is HomeGetAllProductsErrorStates,
      listener: (context, state) {
        if (state is HomeGetAllProductsErrorStates) {
          Components.navigateAndFinish(
              context: context,
              widget: const NoInternetScreen(fromLogin: false));
        }
      },
      builder: (context, state) {
        return state is HomeGetAllProductsLoadingStates
            ? Center(
                child: AdaptiveIndicator(
                  os: Components.getOS(),
                  color: AppColors.mainColor,
                ),
              )
            : Container(
                color: AppColors.coolGreyColor,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: Helper.getMaxHeight() * 0.08,
                    left: Helper.getMaxWidth() * 0.05,
                    right: Helper.getMaxWidth() * 0.05,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        HeadingWidget(defaultIconSize: defaultIconSize),
                        OfferWidget(
                          offerBody: currentOffer.offerBody,
                          offerTitle: currentOffer.offerTitle,
                        ),
                        CategoryWidget(
                          defaultIconSize: defaultIconSize,
                        ),
                        ProductViewerBuilder(
                          title: AppStrings.allProducts,
                          products: HomeCubit.get(context).allProducts,
                        ),
                        MyDivider(
                          color: Colors.white,
                          paddingVertical: AppSize.s20,
                        ),
                        ProductViewerBuilder(
                          title: AppStrings.popularProducts,
                          products: HomeCubit.get(context).allProducts,
                        ),
                        MyDivider(
                          color: Colors.white,
                          paddingVertical: AppSize.s20,
                        ),
                        ProductViewerBuilder(
                          title: AppStrings.topRateProducts,
                          products: HomeCubit.get(context).allProducts,
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
