import 'package:bloc/bloc.dart';
import 'package:bloc_learning/features/auth/domain/usecase/check_biometrics_usecase.dart';
import 'package:meta/meta.dart';

part 'fikrim_yoxdu_state.dart';

class FikrimYoxduCubit extends Cubit<FikrimYoxduState> {
  FikrimYoxduCubit() : super(FikrimYoxduInitial());

  final CheckBiometricsUsecase _checkBiometricsUsecase = CheckBiometricsUsecase();

  Future<void> checkBiometrics() async {
    emit(BiometricsChecking());
    await Future.delayed(Duration(seconds: 1));
    final bool didAuthenticate = await _checkBiometricsUsecase.call();
    if (didAuthenticate) {
      emit(BiometricsSuccess());
    } else {
      emit(BiometricsFailed());
    }
  }
}
