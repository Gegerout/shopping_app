import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/user_model.dart';

class LocalData {
  Future<UserModel?> getUser() async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/userData.json");
    if(file.existsSync()) {
      final data = json.decode(file.readAsStringSync());
      final model = UserModel.fromJson(data);
      return model;
    }
    return null;
  }
}