import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/entity/category_data_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/entity/category_meta_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/usecase/categories_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesUseCase categoriesUseCase;

  CategoriesBloc({required this.categoriesUseCase}) : super(const CategoriesState()) {
    on<GetCategories>(_onGetCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  Future<void> _onGetCategories(GetCategories event, Emitter<CategoriesState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final categories = await categoriesUseCase.getCategories();
      emit(state.copyWith(status: Status.success, categoriesData: categories.data, categoriesMeta: categories.meta));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }

  void _onSelectCategory(SelectCategory event, Emitter<CategoriesState> emit) {
    try {
      emit(state.copyWith(status: Status.success, selectedCategory: event.category));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
