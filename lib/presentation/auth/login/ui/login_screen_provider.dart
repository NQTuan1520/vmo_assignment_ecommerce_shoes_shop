import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/login/bloc/login_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/login/ui/login_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';

class LoginScreenProvider extends StatelessWidget {
  const LoginScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const LoginScreen(),
    );
  }
}
