import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent {increment, decrement}

class CounterBloc extends Bloc<CounterEvent,int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    switch (event) {
      case CounterEvent.increment:
        emit(state+1);
        break;
      case CounterEvent.decrement:
        emit(state-1);
        break;
    }
  }
}