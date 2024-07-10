import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/forgot_password/ui/forgot_password_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';

class ForgotPasswordScreenProvider extends StatelessWidget {
  const ForgotPasswordScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordBloc>(),
      child: const ForgotPasswordScreen(),
    );
  }
}
