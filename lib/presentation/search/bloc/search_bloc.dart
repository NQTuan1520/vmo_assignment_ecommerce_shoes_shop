import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../../domain/home/products/products_detail/usecase/products_usecase.dart';
import '../../../managers/const/const.dart';
import '../../../managers/enum/enum.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductsUseCase productsUseCase;
  final SharedPreferences prefs;

  SearchBloc({required this.productsUseCase, required this.prefs}) : super(const SearchState()) {
    on<SearchProductsEvent>(_onSearchProducts, transformer: debounceTransformer());
    on<ClearSearchResults>(_onClearSearchResults);
    on<LoadSearchHistory>(_onLoadSearchHistory);
    on<DeleteSearchHistoryItem>(_onDeleteSearchHistoryItem);
  }

  EventTransformer<T> debounceTransformer<T>() {
    return (events, mapper) => events.debounce(AppConstants.searchDebounceDuration).switchMap(mapper);
  }

  Future<void> _onSearchProducts(SearchProductsEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await productsUseCase.searchProducts(event.query);
      await _saveSearchHistory(event.query);
      emit(state.copyWith(status: Status.success, products: response.data));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onClearSearchResults(ClearSearchResults event, Emitter<SearchState> emit) async {
    emit(const SearchState(
      status: Status.initial,
      products: [],
      searchHistory: [],
    ));
  }

  Future<void> _onLoadSearchHistory(LoadSearchHistory event, Emitter<SearchState> emit) async {
    final searchHistory = await _getSearchHistory();
    emit(state.copyWith(searchHistory: searchHistory));
  }

  Future<void> _onDeleteSearchHistoryItem(DeleteSearchHistoryItem event, Emitter<SearchState> emit) async {
    await _deleteSearchHistoryItem(event.item);
    final searchHistory = await _getSearchHistory();
    emit(state.copyWith(searchHistory: searchHistory));
  }

  Future<void> _saveSearchHistory(String query) async {
    List<String> searchHistory = prefs.getStringList('search_history') ?? [];
    if (!searchHistory.contains(query)) {
      searchHistory.add(query);
      await prefs.setStringList('search_history', searchHistory);
    }
  }

  Future<List<String>> _getSearchHistory() async {
    return prefs.getStringList('search_history') ?? [];
  }

  Future<void> _deleteSearchHistoryItem(String item) async {
    List<String> searchHistory = prefs.getStringList('search_history') ?? [];
    searchHistory.remove(item);
    await prefs.setStringList('search_history', searchHistory);
  }
}
