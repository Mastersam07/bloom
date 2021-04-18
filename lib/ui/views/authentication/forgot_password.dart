import 'package:bloom/ui/shared/colors.dart';
import 'package:bloom/ui/shared/styles.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Forgot Password',
          style: AppTextStyles.bodyRegularMedium,
        ),
      ),
    );
  }
}
