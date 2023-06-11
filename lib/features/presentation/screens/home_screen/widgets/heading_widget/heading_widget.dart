import 'package:flutter/material.dart';

import '../../../../../../config/styles/icons_broken.dart';
import '../../../../../../core/utils/app_values.dart';
import '../../../../../../core/utils/components.dart';
import '../../../cart_screen/cart_screen.dart';
import 'widgets/custom_search_bar.dart';
import 'widgets/heading_icon_button.dart';

class HeadingWidget extends StatelessWidget {
  final double defaultIconSize;

  const HeadingWidget({
    super.key,
    required this.defaultIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: CustomSearchBar(
          defaultIconSize: defaultIconSize,
        )),
        SizedBox(
          width: AppSize.s10,
        ),
        HeadingIconButton(
            defaultIconSize: defaultIconSize,
            icon: IconBroken.Buy,
            fun: () {
              Components.navigateTo(context, CartScreen());
            }),
        SizedBox(
          width: AppSize.s10,
        ),
        HeadingIconButton(
          defaultIconSize: defaultIconSize,
          icon: IconBroken.Notification,
          fun: () {},
        ),
      ],
    );
  }
}
