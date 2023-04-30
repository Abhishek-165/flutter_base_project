import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'newspage_event.dart';
part 'newspage_state.dart';

class NewspageBloc extends Bloc<NewspageEvent, NewspageState> {
  NewspageBloc() : super(NewspageInitial()) {
    on<NewspageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
