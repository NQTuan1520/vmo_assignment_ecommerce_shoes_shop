import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/auth/usecase/auth_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase authUseCase;
  final SharedPreferences prefs;

  LoginBloc({required this.authUseCase, required this.prefs}) : super(const LoginState()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<GuestLogin>(_onGuestLogin);
    on<LoadSavedCredentials>(_onLoadSavedCredentials);
    on<ToggleRememberMe>(_onToggleRememberMe);
  }

  Future<void> _onLoginButtonPressed(LoginButtonPressed event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    final result = await authUseCase.loginUser(event.email, event.password);
    if (result == "success") {
      if (event.rememberMe) {
        await authUseCase.saveCredentials(event.email, event.password);
        await prefs.setBool('isRememberMe', true);
      } else {
        await authUseCase.clearSavedCredentials();
        await prefs.setBool('isRememberMe', false);
      }
      await authUseCase.saveUserLoggedInState();
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
      await authUseCase.saveUserLoggedInState();
      await prefs.setBool('isGuest', false);
      emit(state.copyWith(status: Status.success));
    } else if (result == 'canceled') {
      emit(state.copyWith(status: Status.failure, errorMessage: result));
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: result));
    }
  }

  Future<void> _onGuestLogin(GuestLogin event, Emitter emit) async {
    await authUseCase.clearSavedCredentials();
    await prefs.setBool('isGuest', true);
    emit(state.copyWith(status: Status.success, isGuest: true));
  }

  Future<void> _onLoadSavedCredentials(LoadSavedCredentials event, Emitter emit) async {
    final credentials = await authUseCase.getSavedCredentials();
    emit(state.copyWith(
      email: credentials['email'],
      password: credentials['password'],
    ));
  }

  void _onToggleRememberMe(ToggleRememberMe event, Emitter emit) {
    emit(state.copyWith(isRememberMe: !state.isRememberMe));
  }
}
