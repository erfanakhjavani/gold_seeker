

import 'package:flutter/material.dart';

class AppLayout {
  static const double textFieldMinHeight = 40.0;
  static const double textFieldMinWidth = 438.0;

  static const double buttonMinHeight = 438.0;
  static const double buttonMinWidth = 438.0;

  static const EdgeInsets primaryAllPadding =  EdgeInsets.all(16);
  static const EdgeInsets primaryTextPadding =  EdgeInsets.symmetric(horizontal: 16);

  static const BoxConstraints primaryBoxConstraints =
  BoxConstraints(minWidth: buttonMinWidth, maxHeight: buttonMinHeight);

}