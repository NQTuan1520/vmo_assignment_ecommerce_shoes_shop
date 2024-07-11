import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

import '../../managers/connectivity/connectivity_manager.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final ConnectivityManager connectivityManager;
  StreamSubscription? connectivitySubscription;

  ConnectivityBloc({required this.connectivityManager}) : super(const ConnectivityState()) {
    on<ConnectivityStatusChanged>(_onConnectivityStatusChanged);
    on<CheckConnectivity>(_onCheckConnectivity);

    connectivitySubscription = connectivityManager.connectivityStream.listen((result) {
      add(ConnectivityStatusChanged(result != ConnectivityResult.none));
    });
  }

  Future<void> _onConnectivityStatusChanged(
    ConnectivityStatusChanged event,
    Emitter<ConnectivityState> emit,
  ) async {
    if (event.isConnected) {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: "No Internet Connection"));
    }
  }

  Future<void> _onCheckConnectivity(
    CheckConnectivity event,
    Emitter<ConnectivityState> emit,
  ) async {
    final isConnected = await connectivityManager.checkConnectivity();
    if (isConnected) {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: "No Internet Connection"));
    }
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
