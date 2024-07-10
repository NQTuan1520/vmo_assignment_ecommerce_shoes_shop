import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/onboarding_screen/ui/onboarding_screen.dart';

import '../bloc/onboarding_bloc.dart';

class OnboardingScreenProvider extends StatelessWidget {
  const OnboardingScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: const OnboardingScreen(),
    );
  }
}
