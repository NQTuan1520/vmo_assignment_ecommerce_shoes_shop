import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../../domain/home/products/products_detail/usecase/products_usecase.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final ProductsUseCase productsUseCase;
  final FirebaseAuth auth;

  FavouriteBloc({required this.productsUseCase, required this.auth}) : super(const FavouriteState()) {
    on<AddFavoriteEvent>(_onAddFavorite);
    on<RemoveFavoriteEvent>(_onRemoveFavorite);
    on<FetchFavoritesEvent>(_onFetchFavorites);
  }

  Future<void> _onAddFavorite(AddFavoriteEvent event, Emitter emit) async {
    try {
      final uid = auth.currentUser?.uid;
      if (uid != null) {
        await productsUseCase.addFavouriteProduct(uid, event.product);
        add(FetchFavoritesEvent());
      }
    } catch (error) {
      emit(state.copyWith(status: Status.failure, errorMessage: error.toString()));
    }
  }

  Future<void> _onRemoveFavorite(RemoveFavoriteEvent event, Emitter emit) async {
    try {
      final uid = auth.currentUser?.uid;
      if (uid != null) {
        await productsUseCase.removeFavouriteProduct(uid, event.productId);
        add(FetchFavoritesEvent());
      }
    } catch (error) {
      emit(state.copyWith(status: Status.failure, errorMessage: error.toString()));
    }
  }

  Future<void> _onFetchFavorites(FetchFavoritesEvent event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final uid = auth.currentUser?.uid;
      if (uid != null) {
        final favorites = await productsUseCase.getFavouriteProducts(uid);
        emit(state.copyWith(status: Status.success, favourites: favorites));
      } else {
        emit(state.copyWith(status: Status.failure, errorMessage: 'User not logged in.'));
      }
    } catch (error) {
      emit(state.copyWith(status: Status.failure, errorMessage: error.toString()));
    }
  }
}
