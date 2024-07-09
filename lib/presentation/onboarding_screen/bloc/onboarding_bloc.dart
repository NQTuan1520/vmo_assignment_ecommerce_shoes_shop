import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<UpdateCurrentPage>(_onUpdateCurrentPage);
  }

  void _onUpdateCurrentPage(UpdateCurrentPage event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentPage: event.page));
  }
}
