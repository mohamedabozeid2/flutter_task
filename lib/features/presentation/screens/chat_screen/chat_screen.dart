
import 'package:flutter/material.dart';

import '../../../../core/utils/Colors.dart';
import '../../../../core/utils/helper.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
