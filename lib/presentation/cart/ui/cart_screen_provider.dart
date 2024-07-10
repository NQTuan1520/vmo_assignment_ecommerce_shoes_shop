import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';

import '../bloc/cart_bloc.dart';
import 'cart_screen.dart';

class CartScreenProvider extends StatelessWidget {
  const CartScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartBloc>(),
      child: const CartScreen(),
    );
  }
}
