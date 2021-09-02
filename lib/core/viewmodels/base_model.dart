import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../enums/viewstate.dart';
import '../services/http_helpers/custom_exception.dart';
import '../utils/app_toast.dart';

class BaseModel extends ChangeNotifier {
  BuildContext _context;
  @mustCallSuper
  void initialize(BuildContext context) {
    _context = context;
  }

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState({ViewState viewState = ViewState.Idle}) {
    _state = viewState;
    notifyListeners();
  }

  void handleFailure(Exception failure) {
    switch (failure.runtimeType) {
      case CustomException:
        AppToast.instance.error(
          _context,
          (failure as CustomException).cause,
        );
        break;
        break;
      case FirebaseAuthException:
        AppToast.instance.error(
          _context,
          handleAuthFailureMessage(failure),
        );
        break;
      default:
        break;
    }
  }

  String handleAuthFailureMessage(FirebaseAuthException failure) {
    switch (failure?.code) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
      case 'account-exists-with-different-credential':
      case 'email-already-in-use':
        return 'Email already in use';
      case 'ERROR_WRONG_PASSWORD':
      case 'wrong-password':
        return 'Wrong email/password combination.';
      case 'ERROR_USER_NOT_FOUND':
      case 'user-not-found':
        return 'No user found with this email.';
      case 'ERROR_USER_DISABLED':
      case 'user-disabled':
        return 'This user has been disabled';
      case 'ERROR_TOO_MANY_REQUESTS':
      case 'operation-not-allowed':
        return 'Too many requests have been logged, please try again later.';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Server error, please try again later.';
      case 'ERROR_INVALID_EMAIL':
      case 'invalid-email':
        return 'Email address is invalid.';
      default:
        return 'Authentication failed. Please try again.';
    }
  }
}
