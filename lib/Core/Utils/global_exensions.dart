

import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension Texts on String {
  Text toHeadline() => Text(this, style: Get.textTheme.headlineMedium);

  TextButton toUnderlineButton({VoidCallback? onPressed}) => TextButton(
    onPressed: onPressed,
    child: Text(this,
          style: Get.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,)));
}