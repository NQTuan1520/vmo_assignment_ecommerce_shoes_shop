import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/categories/categories_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/home/home_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/products/products_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/ui/home_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';

import '../../product_detail/bloc/variants/variants_bloc.dart';

class HomeScreenProvider extends StatelessWidget {
  const HomeScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CategoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<VariantsBloc>(),
        ),
      ],
      child: const HomeScreen(),
    );
  }
}
