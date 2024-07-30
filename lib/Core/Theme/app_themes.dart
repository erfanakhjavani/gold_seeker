

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_colors.dart';

class AppThemes{
  static final ThemeData primary = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      bodyLarge:
      Get.textTheme.bodyLarge?.copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.secondary),
      headlineLarge:
        Get.textTheme.headlineLarge?.copyWith(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white)),

    useMaterial3: true
  );
}