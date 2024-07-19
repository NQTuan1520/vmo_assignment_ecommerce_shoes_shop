import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/categories/categories_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/home/home_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/products/products_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/main/ui/main_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/bloc/variants/variants_bloc.dart';

import '../../profile/bloc /profile_bloc.dart';
import '../../shipping_info/bloc/shipping_bloc.dart';

class MainScreenProvider extends StatelessWidget {
  const MainScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ShippingBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<VariantsBloc>(),
        ),
      ],
      child: const MainScreen(),
    );
  }
}
