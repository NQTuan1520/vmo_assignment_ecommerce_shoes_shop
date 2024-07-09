import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<ToggleDescriptionExpanded>(_onToggleDescriptionExpanded);
  }

  void _onToggleDescriptionExpanded(ToggleDescriptionExpanded event, Emitter<ProductDetailState> emit) {
    emit(state.copyWith(isDescriptionExpanded: !state.isDescriptionExpanded));
  }
}
