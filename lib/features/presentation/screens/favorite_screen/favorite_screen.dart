import 'package:flutter/material.dart';

import '../../../../core/utils/Colors.dart';
import '../../../../core/utils/helper.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.coolGreyColor,
      height: Helper.getMaxHeight(),
      width: Helper.getMaxWidth(),
      child: const Column(
          children: [
            // Expanded(
            //   child: ListView.separated(
            //       itemBuilder: (context, index) {
            //         return FavoriteItemBuilder(
            //           product: favoriteProducts[index],
            //           fun: () {},
            //           functionIcon: AppIcons.favoriteIcon,
            //         );
            //       },
            //       separatorBuilder: (context, index) {
            //         return MyDivider(color: Colors.white,);
            //       },
            //       itemCount: Constants
            //           .getFavoriteProducts()
            //           .length),
            // )
          ]
      ),
    );
  }
}
