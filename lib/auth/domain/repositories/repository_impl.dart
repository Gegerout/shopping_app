import '../usecases/user_usecase.dart';

abstract class Repository {
  Future<UserUseCase?> loginUser(String username, String password);
  Future<UserUseCase?> getUser();
}