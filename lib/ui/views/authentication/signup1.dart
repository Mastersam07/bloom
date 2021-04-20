import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../router.dart' as router;
import '../../shared/colors.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';
import '../../widget/custom_long_button.dart';
import '../../widget/custom_text_field.dart';

class SignupEntry extends StatefulWidget {
  const SignupEntry({Key key}) : super(key: key);

  @override
  _SignupEntryState createState() => _SignupEntryState();
}

class _SignupEntryState extends State<SignupEntry> {
  int pageIndex = 0;
  double getIndicatorWidth() {
    if (pageIndex == 0) {
      return 118.0;
    } else if (pageIndex == 1) {
      return 118 * 2.0;
    } else {
      return 118 * 3.0;
    }
  }

  Widget buildPage1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Sign up',
          style: AppTextStyles.heading1Bold,
        ),
        SizedBox(
          height: screenAwareSize(3, context),
        ),
        Text(
          'Enter your phone number to start your sign up process',
          style: AppTextStyles.bodyRegularLight.copyWith(
            fontSize: screenAwareSize(16, context, width: true),
          ),
        ),
        SizedBox(
          height: screenAwareSize(48, context),
        ),
        //:todo phoneNumber field goes here
        UIHelper.verticalSpaceLarge,
        UIHelper.verticalSpaceMedium,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenAwareSize(40, context, width: true),
          ),
          child: CustomLongButton(
            onTap: () {
              setState(() {
                pageIndex = 1;
              });
            },
            label: 'Next',
          ),
        ),
        SizedBox(
          height: screenAwareSize(24, context),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                router.Router.generateRoute(
                    const RouteSettings(name: RoutePaths.Login)));
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Have an account?',
              style: AppTextStyles.bodyRegularLight,
              children: [
                TextSpan(
                  text: ' Log In',
                  style: AppTextStyles.bodyRegularBold.copyWith(
                    color: AppColors.yellowColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPage2() {
    return ScrollConfiguration(
      behavior: CustomScrollBehaviour(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sign up',
              style: AppTextStyles.heading1Bold,
            ),
            SizedBox(
              height: screenAwareSize(3, context),
            ),
            Text(
              'Enter your phone number to start your sign up process',
              style: AppTextStyles.bodyRegularLight.copyWith(
                fontSize: screenAwareSize(16, context, width: true),
              ),
            ),
            SizedBox(
              height: screenAwareSize(48, context),
            ),
            const CustomTextFormField(
              hintText: 'Fullname',
            ),
            const CustomTextFormField(
              hintText: 'Username',
            ),
            const CustomTextFormField(
              hintText: 'Email Address',
            ),
            const PasswordField(
              hintText: 'Password',
            ),
            const PasswordField(
              hintText: 'Confirm password',
            ),
            UIHelper.verticalSpaceLarge,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenAwareSize(40, context, width: true),
              ),
              child: CustomLongButton(
                onTap: () async {
                  setState(() {
                    pageIndex = 2;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.push(
                        context,
                        router.Router.generateRoute(
                            const RouteSettings(name: RoutePaths.Login)));
                  });
                },
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
                        const RouteSettings(name: RoutePaths.Login)));
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have an account?',
                  style: AppTextStyles.bodyRegularLight,
                  children: [
                    TextSpan(
                      text: ' Sign In',
                      style: AppTextStyles.bodyRegularBold.copyWith(
                        color: AppColors.yellowColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenAwareSize(25, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFinalPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: screenAwareSize(150, context),
          width: screenAwareSize(150, context, width: true),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightGreenColor,
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
        UIHelper.verticalSpaceMediumPlus,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations',
              style: AppTextStyles.heading1Bold.copyWith(
                fontSize: screenAwareSize(24, context, width: true),
              ),
            ),
            Image(
              image: const AssetImage('assets/images/emoji_icon.png'),
              height: screenAwareSize(30, context),
            ),
          ],
        ),
        SizedBox(
          height: screenAwareSize(3, context),
        ),
        Text(
          'Sign up process is now complete.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyRegularLight.copyWith(
            fontSize: screenAwareSize(16, context, width: true),
          ),
        ),
      ],
    );
  }

  Future<bool> popScope() async {
    if (pageIndex == 0) {
      return true;
    } else {
      setState(() {
        pageIndex--;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: popScope,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(30, context, width: true),
              right: screenAwareSize(30, context, width: true),
              // top: screenAwareSize(49, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageIndicator(
                  width: getIndicatorWidth(),
                ),
                SizedBox(
                  height: screenAwareSize(32, context),
                ),
                Expanded(
                    child: [
                  buildPage1(),
                  buildPage2(),
                  buildFinalPage(),
                ][pageIndex])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final double width;
  const PageIndicator({
    Key key,
    @required this.width,
  })  : assert(width != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: screenAwareSize(6, context),
      width: screenAwareSize(width, context, width: true),
      decoration: BoxDecoration(
        color: AppColors.yellowColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class CustomScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
