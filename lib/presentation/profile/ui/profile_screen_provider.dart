import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/profile/ui/profile_screen.dart';

import '../bloc /profile_bloc.dart';

class ProfileScreenProvider extends StatelessWidget {
  const ProfileScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>(),
      child: const ProfileScreen(),
    );
  }
}
