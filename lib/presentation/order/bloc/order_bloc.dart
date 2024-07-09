import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/order/entity/order_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/dio/dio_exception.dart';

import '../../../domain/order/usecase/order_usecase.dart';
import '../../../managers/enum/enum.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderUseCase orderUseCase;
  OrderBloc({required this.orderUseCase}) : super(const OrderState()) {
    on<GetOrder>(_onGetOrder);
  }

  Future<void> _onGetOrder(GetOrder event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await orderUseCase.getOrder();
      emit(state.copyWith(status: Status.success, orders: response.data));
    } on MyDioException catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
