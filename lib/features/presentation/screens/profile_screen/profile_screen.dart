import 'package:flutter/material.dart';

import '../../../../core/utils/Colors.dart';
import '../../../../core/utils/helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.coolGreyColor,
      height: Helper.getMaxHeight(),
      width: Helper.getMaxWidth(),
      child: const Column(),
    );
  }
}
