import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';

class SearchHistoryWidget extends StatelessWidget {
  final BuildContext context;
  final SearchState state;
  final Function(String) onHistoryItemSelected;

  const SearchHistoryWidget({
    super.key,
    required this.context,
    required this.state,
    required this.onHistoryItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.searchHistory.length,
      itemBuilder: (context, index) {
        final item = state.searchHistory[index];
        return ListTile(
          title: Text(item),
          leading: const Icon(Icons.history),
          trailing: IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: () {
              context.read<SearchBloc>().add(DeleteSearchHistoryItem(item));
            },
          ),
          onTap: () {
            onHistoryItemSelected(item);
          },
        );
      },
    );
  }
}
