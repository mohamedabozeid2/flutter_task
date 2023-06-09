import 'package:flutter/material.dart';

import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/layout_with_background_image.dart';

class RegisterScreen extends StatelessWidget {
  final Color formItemsColor = Colors.white;

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: LayoutWithBackgroundImage(
          frontWidget: registerForm(context: context)),
    );
  }

  Widget registerForm({
    required BuildContext context,
  }) =>
      Column(
        children: [
          Text(
            AppStrings.signUp,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: formItemsColor),
          )
        ],
      );
}
