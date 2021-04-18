import 'package:bloom/ui/shared/styles.dart';
import 'package:flutter/material.dart';

class SignupDetails extends StatelessWidget {
  const SignupDetails({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Signup Details',
        style: AppTextStyles.bodyRegularMedium,
      ),
    );
  }
}
