import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/auth/usecase/auth_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase authUseCase;
  LoginBloc({required this.authUseCase}) : super(const LoginState()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<GuestLogin>(_onGuestLogin);
  }

  Future<void> _onLoginButtonPressed(LoginButtonPressed event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await authUseCase.loginUser(event.email, event.password);
    if (result == "success") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isGuest', false);
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: result));
    }
  }

  void _onTogglePasswordVisibility(TogglePasswordVisibility event, Emitter emit) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> _onLoginWithGoogle(LoginWithGoogle event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await authUseCase.signInWithGoogle();
    if (result == 'success') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isGuest', false);
      emit(state.copyWith(status: Status.success));
    } else if (result == 'canceled') {
      emit(state.copyWith(status: Status.failure, errorMessage: result));
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: result));
    }
  }

  Future<void> _onGuestLogin(GuestLogin event, Emitter emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isGuest', true);
    emit(state.copyWith(status: Status.success, isGuest: true));
  }
}
