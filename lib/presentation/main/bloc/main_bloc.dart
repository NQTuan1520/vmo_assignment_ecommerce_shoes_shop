import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<UpdateCurrentIndex>(_onUpdateCurrentIndex);
  }

  void _onUpdateCurrentIndex(UpdateCurrentIndex event, Emitter<MainState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
