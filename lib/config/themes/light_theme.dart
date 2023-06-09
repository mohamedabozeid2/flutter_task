import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_fonts.dart';
import '../../core/utils/colors.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
    headlineSmall: TextStyle(
      fontSize: AppFontSize.s34,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    displaySmall: TextStyle(
      fontSize: AppFontSize.s30,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    titleLarge: TextStyle(
      fontSize: AppFontSize.s28,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: AppFontSize.s26,
      color: Colors.black,
      fontWeight: FontWeightManager.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: AppFontSize.s22,
      fontWeight: FontWeightManager.semiBold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
        fontSize: AppFontSize.s20,
        fontWeight: FontWeightManager.semiBold,
        color: Colors.black),
    titleMedium: TextStyle(
        fontSize: AppFontSize.s18,
        fontWeight: FontWeightManager.regular,
        color: Colors.black),
    titleSmall: TextStyle(
      fontSize: AppFontSize.s14,
      fontWeight: FontWeightManager.regular,
      color: Colors.black,
    ),
  ),
  // primarySwatch: Colors.blue,
  // floatingActionButtonTheme:
  // FloatingActionButtonThemeData(backgroundColor: defaultColor),
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    actionsIconTheme: IconThemeData(color: Colors.black),
    titleSpacing: 20.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColors.mainColor,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.grey,
      elevation: 20.0),
);
