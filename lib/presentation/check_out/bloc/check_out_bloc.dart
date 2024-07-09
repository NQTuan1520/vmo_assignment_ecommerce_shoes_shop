import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/check_out/entity/capture_order_request_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

import '../../../domain/check_out/entity/get_token_check_out_entity.dart';
import '../../../domain/check_out/usecase/check_out_usecase.dart';
import '../../../managers/dio/dio_exception.dart';

part 'check_out_event.dart';
part 'check_out_state.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  final CheckOutUseCase checkOutUseCase;

  CheckOutBloc({required this.checkOutUseCase}) : super(const CheckOutState()) {
    on<CaptureOrder>(_onCaptureOrder);
    on<ResetCheckOut>(_onResetCheckOut);
  }

  Future<void> _onCaptureOrder(CaptureOrder event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? checkOutTokenId = prefs.getString('checkout_token');
      if (checkOutTokenId != null && checkOutTokenId.isNotEmpty) {
        await checkOutUseCase.captureOrder(
          checkOutTokenId,
          event.orderRequest,
        );
        emit(state.copyWith(status: Status.success, showSuccessDialog: true));
      } else {
        emit(state.copyWith(
          status: Status.failure,
          errorMessage: 'Checkout token not found.',
        ));
      }
    } on MyDioException catch (e) {
      emit(state.copyWith(
        errorMessage: e.errorMessage,
        status: Status.failure,
      ));
    }
  }

  void _onResetCheckOut(ResetCheckOut event, Emitter emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('checkout_token');
    await prefs.remove('cart_id');

    emit(const CheckOutState(
      status: Status.initial,
      errorMessage: null,
      tokenCheckOut: null,
    ));
  }
}
