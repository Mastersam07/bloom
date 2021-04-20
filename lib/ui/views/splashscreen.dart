import 'dart:async';

import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/styles.dart';
import '../shared/ui_helpers.dart';
import 'authentication/signup1.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: const SignupEntry(),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage('assets/images/logo.png'),
              height: screenAwareSize(80, context),
              width: screenAwareSize(66.68, context),
            ),
            SizedBox(
              height: screenAwareSize(32, context),
            ),
            const Text(
              'Bloom',
              style: AppTextStyles.display1,
            )
          ],
        ),
      ),
    );
  }
}
