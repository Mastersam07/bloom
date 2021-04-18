import 'package:bloom/ui/shared/colors.dart';
import 'package:bloom/ui/shared/styles.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          'Signin',
          style: AppTextStyles.bodyRegularMedium,
        ),
      ),
    );
  }
}
