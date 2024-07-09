import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/auth/usecase/auth_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthUseCase authUseCase;
  SignUpBloc({required this.authUseCase}) : super(const SignUpState()) {
    on<SignUpButtonPressed>(_onSignUpButtonPressed);
    on<TogglePasswordsVisibility>(_onTogglePasswordVisibility);
  }

  Future<void> _onSignUpButtonPressed(SignUpButtonPressed event, Emitter emit) async {
    emit(state.copyWith(status: Status.initial));
    final result = await authUseCase.createUser(event.name, event.phone, event.email, event.password);
    if (result == "success") {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: result));
    }
  }

  void _onTogglePasswordVisibility(TogglePasswordsVisibility event, Emitter emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
}
