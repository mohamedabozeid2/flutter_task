import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_fonts.dart';
import '../../../../../../../core/utils/app_icons.dart';
import '../../../../../../../core/utils/app_values.dart';
import '../../../../../../../core/utils/colors.dart';

class AddFavoriteButton extends StatelessWidget {
  const AddFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSize.s15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){

            },
            child: Container(
              padding: EdgeInsets.all(AppSize.s20),
              decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s20),
                    bottomLeft: Radius.circular(AppSize.s20),
                  )
              ),
              child: Icon(
                AppIcons.favoriteIcon,
                size: AppFontSize.s24,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
