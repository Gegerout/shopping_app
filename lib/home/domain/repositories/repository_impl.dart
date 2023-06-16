import '../usecases/product_usecase.dart';

abstract class Repository {
  Future<ProductUseCase?> getPhones();
  Future<ProductUseCase?> getLaptops();
  Future<ProductUseCase?> searchProduct(String prompt);
}