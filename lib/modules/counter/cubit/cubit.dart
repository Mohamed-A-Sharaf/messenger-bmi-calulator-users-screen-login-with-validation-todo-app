import 'package:app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());
  int counter = 1;

  static CounterCubit get(context) => BlocProvider.of(context);
}
