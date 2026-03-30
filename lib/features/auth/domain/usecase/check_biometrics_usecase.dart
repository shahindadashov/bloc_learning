import 'package:bloc_learning/features/auth/data/repository/auth_repository_impl.dart';
import 'package:bloc_learning/features/auth/domain/repository/auth_repository.dart';

class CheckBiometricsUsecase {
  final AuthRepository _authRepository = AuthRepositoryImpl();

  Future<bool> call() async {
    return await _authRepository.checkBiometrics();
  }
}
