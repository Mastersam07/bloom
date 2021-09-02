import 'package:flutter/cupertino.dart';

import '../../models/user_model.dart';
import '../../repository/auth_repo.dart';
import '../constants/app_constants.dart';
import '../enums/viewstate.dart';
import '../services/navigation.dart';
import 'base_model.dart';

class SignupModel extends BaseModel {
  final AuthRepo auth;

  final phoneNumberTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final userNameTextController = TextEditingController();
  final fullNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  int _pageIndex = 0;
  int get currentPage => _pageIndex;

  SignupModel(this.auth);

  Future<void> signUp() async {
    setState(viewState: ViewState.Busy);
    final registerResponse = await auth.register(
      UserModel(
        email: emailTextController.text,
        phoneNumber: phoneNumberTextController.text,
        fullName: fullNameTextController.text,
        username: userNameTextController.text,
      ),
      passwordTextController.text,
      confirmPasswordTextController.text,
    );
    if (registerResponse.hasError) {
      setState();
      handleFailure(registerResponse.error);
    } else {
      setPage(2);
      await Future.delayed(const Duration(seconds: 2));
      NavigationService.navigateToReplacing(RoutePaths.HomeTab);
    }
  }

  void setPage(int i) {
    _pageIndex = i;
    setState();
  }
}
