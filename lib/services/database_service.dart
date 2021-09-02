import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const _userCollection = 'users';

  Future<void> saveUserDetails(String userId, UserModel userModel) async {
    await _db.collection(_userCollection).doc(userId).set(userModel.toJson());
  }
}
