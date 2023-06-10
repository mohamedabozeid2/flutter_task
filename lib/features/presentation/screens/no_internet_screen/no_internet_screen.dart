import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/constants.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/network/check_connection.dart';
import '../../../../core/utils/Colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../Layout/Layout.dart';
import '../login_screen/login_screen.dart';

class NoInternetScreen extends StatefulWidget {
  final bool fromLogin;

  const NoInternetScreen({super.key, required this.fromLogin});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          Helper.setMaxHeight(maxHeight: constraints.maxHeight);
          Helper.setMaxWidth(maxWidth: constraints.maxWidth);
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/anims/connection.json'),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppStrings.noInternet,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomButton(
                  fun: () async {
                    await CheckConnection.checkConnection().then((value) {
                      setState(() {
                        if (value == true) {
                          Constants.setInternetConnection(true);
                          Components.navigateAndFinish(
                              context: context,
                              widget: widget.fromLogin
                                  ? const LoginScreen()
                                  : Layout());
                        } else {
                          Constants.setInternetConnection(false);
                          Components.showSnackBar(
                            message: AppStrings.noInternet,
                            textColor: Colors.white,
                          );
                        }
                      });
                    });
                  },
                  text: AppStrings.refresh,
                  height: Helper.getMaxHeight() * 0.07,
                  width: Helper.getMaxWidth() * 0.4,
                  textColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  fontSize: AppFontSize.s14,
                  borderRadius: 15.0)
            ],
          ));
        },
      ),
    );
  }
}
