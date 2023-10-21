import 'package:flutter/material.dart';
import 'package:football/style/app_colors.dart';

final darkTheme = ThemeData(
  textTheme: const  TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
    )
  ),
  dividerColor: AppColors.gray500,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.background,
  ),
  scaffoldBackgroundColor: AppColors.background,
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.only(
      left: 12,
      right: 12,
      top: 16,
      bottom: 16,
    ),
    isDense: true,
    disabledBorder: InputBorder.none,
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(
        color: AppColors.gray300,
      ),
    ),
    hintStyle: const TextStyle(
      color: AppColors.gray500,
      fontSize: 14,
    ),
    iconColor: AppColors.gray300,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.gray500,
      ),
    ),
    errorStyle: const TextStyle(
      fontFamily: 'SF-Pro-Text',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.red,
    ),
    labelStyle: const TextStyle(
      fontFamily: 'SF-Pro-Text',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.gray500,
    ),
  ),
  colorScheme:const  ColorScheme(
    background: AppColors.background,
    onBackground: AppColors.secondary,
    brightness: Brightness.dark,
    error: AppColors.red,
    onError: AppColors.white,
    onPrimary: AppColors.gray200,
    onSecondary: AppColors.gray100,
    onSurface: AppColors.gray300,
    primary: AppColors.primary,
    secondary: AppColors.gray400,
    surface: AppColors.gray500,
    primaryContainer: AppColors.darkGray,
  )
);