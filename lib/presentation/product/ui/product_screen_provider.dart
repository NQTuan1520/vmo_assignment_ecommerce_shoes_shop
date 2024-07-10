import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product/ui/product_screen.dart';

import '../bloc/product_bloc.dart';

class ProductScreenProvider extends StatelessWidget {
  const ProductScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductBloc>(),
      child: const ProductsScreen(),
    );
  }
}
