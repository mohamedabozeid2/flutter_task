import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_values.dart';

class ProductBodyTitle extends StatelessWidget {
  final String title;
  const ProductBodyTitle({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.s15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,

      ),
    );
  }
}
