import 'package:bloc_learning/features/auth/domain/repository/auth_repository.dart';
import 'package:local_auth/local_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalAuthentication auth = LocalAuthentication();
  @override
  Future<bool> checkBiometrics() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        // biometricOnly: true,
      );
      return didAuthenticate;
    } catch (e) {
      return false;
    }
  }
}
