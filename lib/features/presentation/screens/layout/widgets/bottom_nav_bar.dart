import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../../core/utils/helper.dart';
import '../../../controller/home_cubit/home_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<GButton> bottomNavItems = [
    GButton(icon: AppIcons.homeIcon,text: "."),
    GButton(icon: AppIcons.favoriteIcon,text: "."),
    GButton(icon: AppIcons.chatIcon,text: "."),
    GButton(icon: AppIcons.profileIcon,text: "."),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        Helper.setMaxHeight(maxHeight: constraints.maxHeight);
        Helper.setMaxWidth(maxWidth: constraints.maxWidth);
        return GNav(
          tabs: bottomNavItems,
          onTabChange: (index) {
            HomeCubit.get(context).changBotNavBar(index: index);
          },
          padding: EdgeInsets.symmetric(
            vertical: Helper.getMaxHeight() * 0.03,
            horizontal: Helper.getMaxWidth() * 0.01,
          ),
          tabMargin: EdgeInsets.symmetric(
            vertical: AppSize.s5,
            horizontal: AppSize.s20,
          ),
          color: Colors.black,
          // backgroundColor: Colors.black,
          selectedIndex: HomeCubit.get(context).botNavCurrentIndex,
          activeColor: AppColors.mainColor,

          iconSize: AppFontSize.s20,
          // tabBackgroundColor: AppColors.mainColor,
          // textStyle: Theme.of(context)
          //     .textTheme
          //     .subtitle2!
          //     .copyWith(fontSize: AppFontSize.s14),
        );
      },
    );
  }
}
