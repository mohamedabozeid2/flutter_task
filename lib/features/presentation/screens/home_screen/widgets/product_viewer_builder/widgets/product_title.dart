import 'package:flutter/material.dart';

import '../../../../../../../core/utils/colors.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  const ProductTitle({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.secondaryColor
            ),
          ),
        )
      ],
    );
  }
}
