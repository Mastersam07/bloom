import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../ui/shared/colors.dart';
import '../../ui/shared/ui_helpers.dart';

class AppToast {
  AppToast._instance();
  static AppToast instance = AppToast._instance();

  void showSnackBar(BuildContext context,
      {String message, FeedbackType feedbackType = FeedbackType.info}) {
    Flushbar(
      message: message ?? '',
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.symmetric(
        horizontal: screenAwareSize(24, context, width: true),
        vertical: screenAwareSize(36, context),
      ),
      borderRadius: BorderRadius.circular(4),
      backgroundColor: feedbackType == FeedbackType.error
          ? AppColors.notificationBellDot
          : AppColors.greenColor,
    )..show(context);
  }

  void error(BuildContext context, String message) {
    showSnackBar(context, feedbackType: FeedbackType.error, message: message);
  }
}

enum FeedbackType { error, info }
