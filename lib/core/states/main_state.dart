import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/auth/data/repositories/data_repository.dart';

final mainProvider = FutureProvider((ref) async {
  final data = await DataRepository().getUser();
  if(data != null) {
    final model = data.data;
    return model;
  }
  return null;
});