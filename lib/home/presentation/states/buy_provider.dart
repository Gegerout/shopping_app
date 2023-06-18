import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}