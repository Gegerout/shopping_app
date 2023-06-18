import 'package:shopping_app/home/data/models/cart_model.dart';
import 'package:shopping_app/home/domain/usecases/cart_usecase.dart';

import '../usecases/product_usecase.dart';

abstract class Repository {
  Future<ProductUseCase?> getPhones();
  Future<ProductUseCase?> getLaptops();
  Future<ProductUseCase?> searchProduct(String prompt);
  Future<void> addToCart(CartModel model);
  Future<CartUseCase?> loadCart();
}