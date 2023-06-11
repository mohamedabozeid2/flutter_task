import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_icons.dart';
import 'package:flutter_task/core/utils/constants.dart';
import 'package:flutter_task/core/widgets/divider.dart';
import 'package:flutter_task/features/domain/entities/product.dart';
import 'package:flutter_task/features/presentation/screens/favorite_screen/widgets/favorite_item_builder.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> favoriteProducts = Constants.getFavoriteProducts();
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return FavoriteItemBuilder(
                  product: favoriteProducts[index],
                  fun: () {},
                  functionIcon: AppIcons.favoriteIcon,
                );
              },
              separatorBuilder: (context, index) {
                return MyDivider(color: Colors.white,);
              },
              itemCount: Constants
                  .getFavoriteProducts()
                  .length),
        )
      ],
    );
  }
}
