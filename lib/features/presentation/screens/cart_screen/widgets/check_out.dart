import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/utils/strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../controller/home_cubit/home_cubit.dart';
import '../../../controller/home_cubit/home_states.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.s20),
      decoration: BoxDecoration(
        color: AppColors.coolGreyColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: Helper.getMaxWidth() * 0.3,
            child: Column(
              children: [
                Text(
                  AppStrings.total,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                BlocConsumer<HomeCubit, HomeStates>(
                  buildWhen: (previous, current) =>
                      current is HomeRemoveFromCartSuccessState,
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Text(
                      "\$${HomeCubit.get(context).totalCheckMoney.round().toString()}",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  },
                )
              ],
            ),
          ),
          CustomButton(
            fun: () {},
            text: AppStrings.checkOut,
            height: AppSize.s50,
            textColor: Colors.white,
            backgroundColor: AppColors.orange,
            borderRadius: AppSize.s15,
            width: Helper.getMaxWidth() * 0.5,
            fontSize: AppFontSize.s18,
          )
        ],
      ),
    );
  }
}
