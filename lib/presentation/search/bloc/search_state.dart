part of 'search_bloc.dart';

class SearchState extends Equatable {
  final Status status;
  final List<ProductDataEntity> products;
  final List<String> searchHistory;
  final String? errorMessage;

  const SearchState({
    this.status = Status.initial,
    this.products = const [],
    this.searchHistory = const [],
    this.errorMessage,
  });

  SearchState copyWith({
    Status? status,
    List<ProductDataEntity>? products,
    List<String>? searchHistory,
    String? errorMessage,
  }) {
    return SearchState(
      status: status ?? this.status,
      products: products ?? this.products,
      searchHistory: searchHistory ?? this.searchHistory,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, products, searchHistory, errorMessage];
}
