import 'package:shopping_app/home/data/data_sources/local_data.dart';
import 'package:shopping_app/home/data/data_sources/remote_data.dart';
import 'package:shopping_app/home/data/models/cart_model.dart';
import 'package:shopping_app/home/domain/repositories/repository_impl.dart';
import 'package:shopping_app/home/domain/usecases/cart_usecase.dart';
import 'package:shopping_app/home/domain/usecases/product_usecase.dart';

class DataRepository extends Repository {
  @override
  Future<ProductUseCase?> getPhones() async {
    final data = await RemoteData().getPhones();
    if(data != null) {
      final usecase = ProductUseCase(data);
      return usecase;
    }
    return null;
  }

  @override
  Future<ProductUseCase?> getLaptops() async {
    final data = await RemoteData().getLaptops();
    if(data != null) {
      final usecase = ProductUseCase(data);
      return usecase;
    }
    return null;
  }

  @override
  Future<ProductUseCase?> searchProduct(String prompt) async {
    final data = await RemoteData().searchProduct(prompt);
    if(data != null) {
      final usecase = ProductUseCase(data);
      return usecase;
    }
    return null;
  }

  @override
  Future<void> addToCart(CartModel model) async {
    await LocalData().addToCart(model);
  }

  @override
  Future<CartUseCase?> loadCart() async {
    final data = await LocalData().loadCart();
    if(data != null) {
      final usecase = CartUseCase(data);
      return usecase;
    }
    return null;
  }

  @override
  Future<void> clearCart() async {
    await LocalData().clearCart();
  }
}