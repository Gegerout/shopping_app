import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/auth/data/repositories/data_repository.dart';

import '../../data/models/user_model.dart';

final signinProvider = ChangeNotifierProvider((ref) => SigninNotifier());

class SigninNotifier extends ChangeNotifier {
  bool isValid = false;

  Future<UserModel?> loginUser(String username, String password) async {
    final data = await DataRepository().loginUser(username, password);
    if(data != null) {
      final model = data.data;
      return model;
    }
    return null;
  }

  void checkCreds(String username, String password) {
    if(username.length > 3 && password.length > 6) {
      isValid = true;
    }
    else {
      isValid = false;
    }
    notifyListeners();
  }

  void checkCredsSignup(String username, String password, String confirm) {
    if(username.length > 3 && password.length > 6 && confirm.length > 6) {
      isValid = true;
    }
    else {
      isValid = false;
    }
    notifyListeners();
  }
}