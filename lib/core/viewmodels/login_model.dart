import 'package:flutter/cupertino.dart';

import '../../repository/auth_repo.dart';
import '../constants/app_constants.dart';
import '../enums/viewstate.dart';
import '../services/navigation.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthRepo auth;

  LoginModel(this.auth);
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<void> signIn() async {
    setState(viewState: ViewState.Busy);
    final registerResponse = await auth.login(
      emailTextController.text,
      passwordTextController.text,
    );
    if (registerResponse.hasError) {
      setState();
      handleFailure(registerResponse.error);
    } else {
      NavigationService.navigateToReplacing(RoutePaths.HomeTab);
    }
  }
}
