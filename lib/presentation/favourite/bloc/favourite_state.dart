part of 'favourite_bloc.dart';

class FavouriteState extends Equatable {
  final Status status;
  final List<ProductDataEntity> favourites;
  final String? errorMessage;

  const FavouriteState({this.status = Status.initial, this.favourites = const [], this.errorMessage});

  FavouriteState copyWith({
    Status? status,
    List<ProductDataEntity>? favourites,
    String? errorMessage,
  }) {
    return FavouriteState(
      status: status ?? this.status,
      favourites: favourites ?? this.favourites,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, favourites, errorMessage];
}
