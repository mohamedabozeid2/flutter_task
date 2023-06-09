import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/themes/light_theme.dart';
import 'core/services/services_locator.dart';
import 'core/utils/helper.dart';
import 'core/utils/strings.dart';
import 'features/presentation/controller/home_cubit/home_cubit.dart';
import 'features/presentation/controller/user_cubit/user_cubit.dart';
import 'features/presentation/screens/login_screen/login_screen.dart';

class MarketSquare extends StatelessWidget {
  const MarketSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 788.7272727272727),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            Helper.setMaxHeight(maxHeight: constraints.maxHeight);
            Helper.setMaxWidth(maxWidth: constraints.maxWidth);
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (BuildContext context) => UserCubit(
                    sl(),
                    sl(),
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => HomeCubit(),
                ),
              ],
              child: GetMaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                title: AppStrings.appName,
                theme: ThemeData.light(),
                darkTheme: lightTheme,
                themeMode: ThemeMode.dark,
                home: child,
              ),
            );
          },
        );
      },
      child: LoginScreen(),
    );
  }
}
