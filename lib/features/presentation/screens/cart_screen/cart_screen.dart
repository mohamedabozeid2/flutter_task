import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/divider.dart';
import '../../../domain/entities/product.dart';
import '../../controller/home_cubit/home_cubit.dart';
import '../../controller/home_cubit/home_states.dart';
import 'widgets/cart_item_builder.dart';
import 'widgets/check_out.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<Product> cartProducts = HomeCubit.get(context).cartItems;
    return BlocConsumer<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          current is HomeRemoveFromCartSuccessState,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.coolGreyColor,
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  AppStrings.yourCart,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "${HomeCubit.get(context).cartItems.length} Items",
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
          body: Container(
            height: Helper.getMaxHeight(),
            width: Helper.getMaxWidth(),
            color: AppColors.coolGreyColor,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartItemBuilder(product: cartProducts[index]);
                      },
                      separatorBuilder: (context, index) {
                        return MyDivider(color: Colors.white);
                      },
                      itemCount: cartProducts.length),
                ),
                const CheckOut()
              ],
            ),
          ),
        );
      },
    );
  }
}
