import 'package:bloom/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/services/error_catch_mixin.dart';
import '../core/services/http_helpers/custom_exception.dart';
import '../core/services/http_helpers/data_response.dart';
import '../models/user_model.dart';

abstract class AuthRepo {
  Future<DataResponse<bool>> register(
      UserModel user, String password, String conPass);
  Future<DataResponse<bool>> login(String email, String password);
}

class AuthenticationRepository with ErrorCatchMixin implements AuthRepo {
  final DatabaseService databaseService;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthenticationRepository(this.databaseService);
  @override
  Future<DataResponse<bool>> login(String email, String password) async {
    return catchASyncError<bool>(() async {
      await _auth.signInWithEmailAndPassword(
        email: email?.trim(),
        password: password?.trim(),
      );
      return DataResponse(
        data: true,
      );
    });
  }

  @override
  Future<DataResponse<bool>> register(
      UserModel user, String password, String conPass) async {
    return catchASyncError<bool>(() async {
      if (password?.trim() != conPass?.trim()) {
        throw CustomException('Passwords do not match');
      }
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: user.email?.trim(),
        password: password?.trim(),
      );
      await databaseService.saveUserDetails(newUser.user?.uid ?? '', user);
      return DataResponse(
        data: true,
      );
    });
  }
}
