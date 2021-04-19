import 'package:bloom/ui/shared/styles.dart';
import 'package:bloom/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class SignupDetails extends StatelessWidget {
  const SignupDetails({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0
        ),
        child: Column(
          children: [
            Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12),
               color: AppColors.yellowColor,
             ),
             width: MediaQuery.of(context).size.width * (2/3),
            ),
            Text(
              "Sign Up",
              style: AppTextStyles.heading1Bold,
              ),
            Text(
              "We require your full details to create your account",
              style: AppTextStyles.bodyRegularMedium,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Fullname',
                fillColor: AppColors.ashColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                 ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                fillColor: AppColors.ashColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                 ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                fillColor: AppColors.ashColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                 ),
              ),
            ),
            TextFormField(
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: AppColors.ashColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                 ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                fillColor: AppColors.ashColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                 ),
              ),
            ),
            TextButton(
              child: Text(
                "Next",
                style: AppTextStyles.bodyRegularLight,
                color: Colors.white,
                ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                ),
    
              ),
            ),
            Row(
              children: [
                Text("Already have an account?"),
                Text("Sign in", color: AppColors.yellowColor),
              ],
            ),
          ],
      ),
      ),
    );
  }
}
