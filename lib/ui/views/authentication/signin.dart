import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../router.dart' as router;
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';
import '../../widget/custom_long_button.dart';
import '../../widget/custom_text_field.dart';
import 'signup1.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: screenAwareSize(30, context, width: true),
          right: screenAwareSize(30, context, width: true),
          top: screenAwareSize(49, context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PageIndicator(width: double.infinity),
            SizedBox(
              height: screenAwareSize(32, context),
            ),
            const Text(
              'Sign In',
              style: AppTextStyles.heading1Bold,
            ),
            SizedBox(
              height: screenAwareSize(3, context),
            ),
            Text(
              'Welcome Back! Enter your details to continue',
              style: AppTextStyles.bodyRegularLight.copyWith(
                fontSize: screenAwareSize(16, context, width: true),
              ),
            ),
            SizedBox(
              height: screenAwareSize(48, context),
            ),
            const CustomTextFormField(
              hintText: 'Username',
            ),
            const PasswordField(
              hintText: 'Password',
            ),
            UIHelper.verticalSpaceLarge,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenAwareSize(40, context, width: true),
              ),
              child: CustomLongButton(
                onTap: () async {},
                label: 'Next',
              ),
            ),
            SizedBox(
              height: screenAwareSize(25, context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    router.Router.generateRoute(
                        const RouteSettings(name: RoutePaths.SignUp)));
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Are you new here?',
                  style: AppTextStyles.bodyRegularLight,
                  children: [
                    TextSpan(
                      text: ' Sign Up',
                      style: AppTextStyles.bodyRegularBold.copyWith(
                        color: AppColors.yellowColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
