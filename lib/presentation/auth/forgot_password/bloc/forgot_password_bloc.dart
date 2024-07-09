import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/auth/usecase/auth_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthUseCase authUseCase;
  ForgotPasswordBloc({required this.authUseCase}) : super(const ForgotPasswordState()) {
    on<ConfirmButtonPressed>(_onConfirmButtonPressed);
  }

  Future<void> _onConfirmButtonPressed(ConfirmButtonPressed event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await authUseCase.forgotPassword(event.email);
    if (result == "success") {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: result));
    }
  }
}
