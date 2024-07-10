import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/favourite/ui/favourite_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';

import '../../settings/bloc/theme/theme_bloc.dart';
import '../bloc/favourite_bloc.dart';

class FavoriteScreenProvider extends StatelessWidget {
  const FavoriteScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FavouriteBloc>(),
        ),
      ],
      child: const FavouritesScreen(),
    );
  }
}
