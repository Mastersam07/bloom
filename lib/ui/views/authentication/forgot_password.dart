import '../../shared/colors.dart';
import '../../shared/styles.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
