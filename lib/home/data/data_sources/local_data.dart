import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/home/data/models/cart_model.dart';

class LocalData {
  Future<void> addToCart(CartModel model) async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/cartData.json");
    file.writeAsStringSync(json.encode(model), mode: FileMode.append);
  }

  Future<List<CartModel>?> loadCart() async {
    var dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/cartData.json");
    if(file.existsSync()) {
      final data = json.decode(file.readAsStringSync());
      final model = (data as List).map((e) => CartModel.fromJson(e)).toList();
      return model;
    }
    return null;
  }
}