import 'package:bloom/core/services/error_catch_mixin.dart';
import 'package:bloom/models/user_model.dart';
import 'package:bloom/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/services/http_helpers/data_response.dart';

abstract class AuthRepo {
  Future<DataResponse<bool>> register(UserModel user, String password);
  Future<DataResponse<bool>> login(String email, String password);
}

class AuthenticationRepository with ErrorCatchMixin implements AuthRepo {
  final DatabaseService databaseService;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthenticationRepository(this.databaseService);
  @override
  Future<DataResponse<bool>> login(String email, String password) async {
    return catchASyncError<bool>(() async {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return DataResponse(
        data: true,
      );
    });
  }

  @override
  Future<DataResponse<bool>> register(UserModel user, String password) async {
    return catchASyncError<bool>(() async {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      await databaseService.saveUserDetails(newUser.user?.uid ?? '', user);
      return DataResponse(
        data: true,
      );
    });
  }
}
