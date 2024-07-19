import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';

import '../../../domain/check_out/entity/get_token_check_out_entity.dart';
import '../bloc/check_out_bloc.dart';
import 'check_out_screen.dart';

class CheckOutScreenProvider extends StatelessWidget {
  final GetTokenCheckOutEntity checkoutToken;

  const CheckOutScreenProvider({super.key, required this.checkoutToken});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CheckOutBloc>(),
        ),
      ],
      child: CheckOutScreen(
        checkoutToken: checkoutToken,
      ),
    );
  }
}
