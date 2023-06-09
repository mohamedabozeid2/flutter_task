import 'package:flutter/material.dart';

import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/strings.dart';
import '../../register_screen/register_screen.dart';

class NoEmailWidget extends StatelessWidget {
  final Color textColor;
  const NoEmailWidget({super.key, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.noEmail,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: textColor),
        ),
        SizedBox(
          width: AppSize.s10,
        ),
        GestureDetector(
          onTap: () {
            Components.navigateTo(
                context, const RegisterScreen());
          },
          child: Container(
            padding: EdgeInsets.all(AppSize.s7),
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius:
                BorderRadius.circular(AppSize.s10)),
            child: Text(
              AppStrings.signUp,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: textColor),
            ),
          ),
        ),
      ],
    );
  }
}
