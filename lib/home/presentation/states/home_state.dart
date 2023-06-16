import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/home/data/repositories/data_repository.dart';

final phonesProvider = FutureProvider((ref) async {
  final data = await DataRepository().getPhones();
  if(data != null) {
    final model = data.data;
    return model;
  }
  else {
    throw Error();
  }
});

final laptopsProvider = FutureProvider((ref) async {
  final data = await DataRepository().getLaptops();
  if(data != null) {
    final model = data.data;
    return model;
  }
  else {
    throw Error();
  }
});