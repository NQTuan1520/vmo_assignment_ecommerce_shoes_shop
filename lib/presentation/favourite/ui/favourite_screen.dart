import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/shimmer_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/favourite/widgets/favorites_grid_widget.dart';

import '../../../managers/enum/enum.dart';
import '../../settings/bloc/theme/theme_bloc.dart';
import '../bloc/favourite_bloc.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  static const String routeName = '/favorites';

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final MyColorTheme colorTheme = MyColorTheme();

  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "favorites".tr(),
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: state.isDarkMode ? colorTheme.blueBottomBarDark : colorTheme.blueBottomBar,
          ),
          body: BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return ShimmerWidget(height: double.infinity.h, width: double.infinity.w);
              } else if (state.status == Status.success && state.favourites!.isEmpty) {
                return Center(child: Text("no_favorites".tr(), style: TextStyle(fontSize: 18.sp)));
              } else if (state.status == Status.success) {
                return FavoritesGridWidget(favorites: state.favourites!);
              } else if (state.status == Status.failure) {
                return Center(
                    child: Text(state.errorMessage ?? "fail_to_load_favorite".tr(), style: TextStyle(fontSize: 18.sp)));
              } else {
                return Center(child: Text("unknown_state".tr(), style: TextStyle(fontSize: 18.sp)));
              }
            },
          ),
        );
      },
    );
  }
}
