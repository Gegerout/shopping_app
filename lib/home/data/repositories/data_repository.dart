import 'package:shopping_app/home/data/data_sources/remote_data.dart';
import 'package:shopping_app/home/domain/repositories/repository_impl.dart';
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
}