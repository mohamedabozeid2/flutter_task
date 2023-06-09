import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/presentation/screens/login_screen/login_screen.dart';
import 'package:get/get.dart';

import 'config/themes/light_theme.dart';
import 'core/utils/strings.dart';

class MarketSquare extends StatelessWidget {
  const MarketSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 788.7272727272727),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: ThemeData.light(),
          darkTheme: lightTheme,
          themeMode: ThemeMode.dark,
          home: child,
        );
      },
      child: const LoginScreen(),
    );  }
}
