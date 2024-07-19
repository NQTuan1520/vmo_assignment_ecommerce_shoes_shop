import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/entity/product_data_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/products/products_detail/usecase/products_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsUseCase productsUseCase;

  ProductBloc({required this.productsUseCase}) : super(const ProductState()) {
    on<GetProducts>(_onGetProducts);
    on<LoadMoreProducts>(_onLoadMoreProducts);
  }

  Future<void> _onGetProducts(GetProducts event, Emitter<ProductState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final products = await productsUseCase.getProducts();
      emit(state.copyWith(
        status: Status.success,
        productsData: products.data?.take(10).toList() ?? [],
        totalLoaded: 10,
        allProducts: products.data ?? [],
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onLoadMoreProducts(LoadMoreProducts event, Emitter<ProductState> emit) async {
    if (state.totalLoaded >= state.allProducts.length) return;

    try {
      emit(state.copyWith(status: Status.loadingMore));
      final additionalProducts = state.allProducts.skip(state.totalLoaded).take(10).toList();
      emit(state.copyWith(
        status: Status.success,
        productsData: List.of(state.productsData)..addAll(additionalProducts),
        totalLoaded: state.totalLoaded + additionalProducts.length,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
