import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/search/ui/search_screen.dart';

import '../bloc/search_bloc.dart';

class SearchScreenProvider extends StatelessWidget {
  const SearchScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: const SearchScreen(),
    );
  }
}
