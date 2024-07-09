part of 'favourite_bloc.dart';

class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class AddFavoriteEvent extends FavouriteEvent {
  final ProductDataEntity product;

  const AddFavoriteEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFavoriteEvent extends FavouriteEvent {
  final String productId;

  const RemoveFavoriteEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class FetchFavoritesEvent extends FavouriteEvent {}
