import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class CustomLongButton extends StatelessWidget {
  final double height;
  final Function onTap;
  final Color color;
  final Color labelColor;
  final String label;

  const CustomLongButton(
      {Key key,
      this.height,
      this.onTap,
      this.color,
      this.labelColor,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenAwareSize(height ?? 68, context),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? AppColors.headingTextColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label ?? '',
            style: AppTextStyles.bodyRegularBold.copyWith(
              color: labelColor ?? Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              // fontFamily: 'Inter'
            ),
          ),
        ),
      ),
    );
  }
}
