import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>(_onSplashStarted);
    on<SplashCompleted>(_onSplashCompleted);
    add(SplashStarted());
  }

  void _onSplashStarted(SplashStarted event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    add(SplashCompleted());
  }

  void _onSplashCompleted(SplashCompleted event, Emitter<SplashState> emit) {
    emit(SplashLoaded());
  }
}
