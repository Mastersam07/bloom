import 'package:bloom/ui/shared/styles.dart';
import 'package:flutter/material.dart';

class SignupEntry extends StatelessWidget {
  const SignupEntry({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Signup Entry',
        style: AppTextStyles.bodyRegularMedium,
      ),
    );
  }
}
