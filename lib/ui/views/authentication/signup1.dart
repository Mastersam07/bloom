import 'package:bloom/ui/shared/styles.dart';
import 'package:bloom/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class SignupEntry extends StatelessWidget {
  const SignupEntry({Key key}) : super(key: key);
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
             width: MediaQuery.of(context).size.width * (1/3),
            ),
            Text(
              "Sign Up",
              style: AppTextStyles.heading1Bold,
              ),
            Text(
              "Enter your phone number to start your",
              style: AppTextStyles.bodyRegularMedium,
              ),
            Text(
              "sign up process",
              style: AppTextStyles.bodyRegularMedium,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.flag),
                labelText: '+234-000-000-0000',
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
          ],
        ),
        ),
    );
  }
}
