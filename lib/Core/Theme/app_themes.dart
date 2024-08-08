

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs/Core/Constants/app_colors.dart';

class AppThemes{
  static final ThemeData primary = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      labelLarge:
      Get.textTheme.labelLarge?.copyWith(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.secondary),
        labelMedium:
      Get.textTheme.labelMedium?.copyWith(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.secondary),
        labelSmall:
      Get.textTheme.labelSmall?.copyWith(fontSize: 8,fontWeight: FontWeight.w400,color: AppColors.secondary),
      bodySmall:
      Get.textTheme.bodySmall?.copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.secondary),
       bodyMedium:
       Get.textTheme.bodyMedium?.copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.secondary),
       bodyLarge:
      Get.textTheme.bodyLarge?.copyWith(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.secondary),
      headlineMedium:
      Get.textTheme.headlineMedium?.copyWith(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white),
      headlineSmall:
      Get.textTheme.headlineSmall?.copyWith(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),
      headlineLarge:
        Get.textTheme.headlineLarge?.copyWith(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white)),

    useMaterial3: true
  );
}