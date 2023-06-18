import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/home/data/models/cart_model.dart';
import 'package:shopping_app/home/data/repositories/data_repository.dart';

final getCartProvider = FutureProvider<List<CartModel>?>((ref) async {
  final data = await DataRepository().loadCart();
  if(data != null) {
    return data.data;
  }
  return null;
});