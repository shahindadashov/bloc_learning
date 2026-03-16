import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _count = 0;

  CounterBloc() : super(CounterInitial()) {
    on<IncrementCount>(_onIncrement);

    on<DecrementCount>((event, emit) async {
      emit(CounterUpdateInProgress());
      await Future.delayed(Duration(seconds: 1));
      _count--;
      emit(CounterStateUpdated(count: _count));
    });
  }
  void _onIncrement(IncrementCount event, Emitter<CounterState> emit) {
    final current = _count;
    emit(CounterStateUpdated(count: current + 1));
  }
}
