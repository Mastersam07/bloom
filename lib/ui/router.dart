import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';
import 'views/authentication/forgot_password.dart';
import 'views/authentication/signin.dart';
import 'views/authentication/signup1.dart';
import 'views/authentication/signup2.dart';
import 'views/dashboard/home.dart';
import 'views/dashboard/tab_starter.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Login:
        debugPrint(settings.name);
        return MaterialPageRoute(builder: (_) => const SignIn());
      case RoutePaths.SignUp:
        return MaterialPageRoute(builder: (_) => const SignupEntry());
      case RoutePaths.SignUpDetails:
        return MaterialPageRoute(builder: (_) => const SignupDetails());
      case RoutePaths.Dashboard:
        return MaterialPageRoute(builder: (_) => const Home());
      case RoutePaths.ForgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case RoutePaths.HomeTab:
        return MaterialPageRoute(builder: (_) => const HomeTab());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
