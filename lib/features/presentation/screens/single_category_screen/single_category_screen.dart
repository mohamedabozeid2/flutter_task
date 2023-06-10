import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
