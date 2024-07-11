import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/favourite/ui/favourite_screen_provider.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/ui/home_screen_provider.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/settings/ui/setting_screen_provider.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/main/bloc/main_bloc.dart';

import '../../settings/bloc/theme/theme_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final MyColorTheme colorTheme = MyColorTheme();

  final List<Widget> _screens = [
    const FavoriteScreenProvider(),
    const HomeScreenProvider(),
    const SettingScreenProvider(),
  ];

  void _onNavItemTapped(BuildContext context, int index) {
    context.read<MainBloc>().add(UpdateCurrentIndex(index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return Scaffold(
            body: BlocBuilder<MainBloc, MainState>(
              builder: (context, mainState) {
                return IndexedStack(
                  index: mainState.currentIndex,
                  children: _screens,
                );
              },
            ),
            bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
              builder: (context, mainState) {
                return CurvedNavigationBar(
                  index: mainState.currentIndex,
                  backgroundColor: Colors.white,
                  animationCurve: Curves.easeInOut,
                  color: themeState.isDarkMode ? colorTheme.blueBottomBarDark : colorTheme.blueBottomBar,
                  buttonBackgroundColor:
                      themeState.isDarkMode ? colorTheme.blueBottomBarDark : colorTheme.blueBottomBar,
                  height: 65.h,
                  items: <Widget>[
                    Icon(Icons.favorite, size: 30.sp, color: Colors.white),
                    Icon(Icons.home, size: 30.sp, color: Colors.white),
                    Icon(Icons.settings, size: 30.sp, color: Colors.white),
                  ],
                  onTap: (index) => _onNavItemTapped(context, index),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
