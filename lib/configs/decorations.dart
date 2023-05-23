import 'dart:io';

import 'package:flutter/material.dart';

import 'colors.dart';

class AppDecorations {
  static BoxDecoration iosDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        AppColors.orange100,
        AppColors.yellow100,
        AppColors.orange20,
      ],
    ),
  );

  static BoxDecoration androidDecoration = const BoxDecoration(
    color: AppColors.orange100,
  );

  static BoxDecoration getOSDecoration() {
    return Platform.isIOS ? iosDecoration : androidDecoration;
  }

  static BoxDecoration getGradientDecoration() {
    return Platform.isIOS ? iosDecoration : androidDecoration;
  }
}
