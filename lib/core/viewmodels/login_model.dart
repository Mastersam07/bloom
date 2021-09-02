import '../../repository/auth_repo.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthRepo auth;

  LoginModel(this.auth);
}
