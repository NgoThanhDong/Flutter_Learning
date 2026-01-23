import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(const CounterState(count: 0, isLoading: false)) {
    on<IncrementPressed>(_onIncrement);
  }

  Future<void> _onIncrement(
    IncrementPressed event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1));

    emit(
      state.copyWith(
        count: state.count + 1,
        isLoading: false,
      ),
    );
  }
}