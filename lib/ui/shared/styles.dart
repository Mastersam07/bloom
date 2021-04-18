import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const TextStyle display1 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.headingColor,
    fontSize: 40,
  );
  static const TextStyle heading1Bold = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.headingColor,
    fontSize: 30,
  );
  static const TextStyle bodyRegularBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.bodyTextColor,
    fontSize: 14,
  );
  static const TextStyle bodyRegularMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.bodyTextColor,
    fontSize: 14,
  );
  static const TextStyle bodyRegularLight = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.bodyTextColor,
    fontSize: 14,
  );
  static const TextStyle bodyMediumBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.bodyTextColor,
    fontSize: 12,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.bodyTextColor,
    fontSize: 12,
  );
  static const TextStyle bodyMediumLight = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.bodyTextColor,
    fontSize: 12,
  );
  static const TextStyle bodySmallBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.bodyTextColor,
    fontSize: 10,
  );
  static const TextStyle bodySmallMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.bodyTextColor,
    fontSize: 10,
  );
  static const TextStyle bodySmallLight = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.bodyTextColor,
    fontSize: 10,
  );

  // hint
  static const TextStyle hintText = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.hintColor,
    fontSize: 14,
  );

  // button
  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.buttonTextColor,
    fontSize: 14,
  );
}

dynamic routeTo(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.push(
      context,
      Platform.isIOS
          ? CupertinoPageRoute(
              builder: (context) => view, fullscreenDialog: dialog)
          : MaterialPageRoute(
              builder: (context) => view, fullscreenDialog: dialog));
}
