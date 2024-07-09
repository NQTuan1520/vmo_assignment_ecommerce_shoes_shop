part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchProductsEvent extends SearchEvent {
  final String query;

  const SearchProductsEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class ClearSearchResults extends SearchEvent {}

class LoadSearchHistory extends SearchEvent {}

class DeleteSearchHistoryItem extends SearchEvent {
  final String item;

  const DeleteSearchHistoryItem(this.item);
}
