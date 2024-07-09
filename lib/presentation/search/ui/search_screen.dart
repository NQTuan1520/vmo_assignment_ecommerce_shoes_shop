import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/custom_back_button.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/search/bloc/search_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/search/widgets/product_grid_widget.dart';
import '../../../managers/enum/enum.dart';
import '../widgets/search_history_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(LoadSearchHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search_Products".tr()),
        leading: GestureDetector(
            onTap: () {
              context.read<SearchBloc>().add(ClearSearchResults());
              Navigator.of(context).pop();
            },
            child: const CustomBackButton()),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                context.read<SearchBloc>().add(SearchProductsEvent(query: query));
              },
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search_for_shoes".tr(),
                hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.searchHistory.isNotEmpty)
                SearchHistoryWidget(
                  context: context,
                  state: state,
                  onHistoryItemSelected: (item) {
                    _searchController.text = item;
                    context.read<SearchBloc>().add(SearchProductsEvent(query: item));
                  },
                ),
              if (state.status == Status.loading)
                const Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              else if (state.status == Status.success)
                ProductGridWidget(
                  context: context,
                  products: state.products,
                )
              else if (state.status == Status.failure)
                Center(child: Text(state.errorMessage ?? "Error occurred".tr()))
              else
                Center(child: Text("Search_some_shoes".tr())),
            ],
          );
        },
      ),
    );
  }
}
