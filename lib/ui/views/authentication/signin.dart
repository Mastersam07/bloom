import 'package:bloom/ui/shared/styles.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);
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
             width: MediaQuery.of(context).size.width * (3/3),
            ),
            Text(
              "Sign In",
              style: AppTextStyles.heading1Bold,
              ),
            Text (
              "Welcome Back! Enter your details to continue",
              style: AppTextStyles.bodyRegularMedium,
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
                labelText: 'Password',
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
                Text("Are you new here?"),
                Text("Sign Up", color: AppColors.yellowColor),
              ],
            ),
          ],
      ),
      ),
    );
  }
}
