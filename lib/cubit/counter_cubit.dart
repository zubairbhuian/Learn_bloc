import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(value: 0,wasIncriment: true));

  incriment() => emit(CounterState(value: state.value + 1,wasIncriment: true));
  decriment() => emit(CounterState(value: state.value - 1,wasIncriment: false));
}
