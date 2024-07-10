import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/login/bloc/login_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/sign_up/ui/sign_up_screen.dart';

import '../bloc/sign_up_bloc.dart';

class SignUpScreenProvider extends StatelessWidget {
  const SignUpScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SignUpBloc>(),
        ),
      ],
      child: const SignUpScreen(),
    );
  }
}
