import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/home/home_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/settings/ui/settings_screen.dart';

import '../../../managers/service_locator/di.dart';

class SettingScreenProvider extends StatelessWidget {
  const SettingScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
      ],
      child: const SettingsScreen(),
    );
  }
}
