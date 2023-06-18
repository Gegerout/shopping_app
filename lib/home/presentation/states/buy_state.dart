import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/home/data/models/cart_model.dart';
import 'package:shopping_app/home/data/repositories/data_repository.dart';

final buyProvider = ChangeNotifierProvider((ref) => BuyNotifier());

class BuyNotifier extends ChangeNotifier {
  int count = 1;

  void increment() {
    count += 1;
    notifyListeners();
  }

  void decrement() {
    count -= 1;
    notifyListeners();
  }

  void addToCart(String title, String price, String image, int count) async {
    final model = CartModel(title, price, image, count);
    await DataRepository().addToCart(model);
  }
}