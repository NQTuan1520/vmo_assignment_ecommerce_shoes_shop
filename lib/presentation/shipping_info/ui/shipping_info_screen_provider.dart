import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/shipping_info/ui/shipping_info_screen.dart';

import '../bloc/shipping_bloc.dart';

class ShippingInfoScreenProvider extends StatelessWidget {
  const ShippingInfoScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShippingBloc>(),
      child: const ShippingInfoScreen(),
    );
  }
}
