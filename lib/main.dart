import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/navigation/routes.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/cart/bloc/cart_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/check_out/bloc/check_out_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/favourite/bloc/favourite_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/categories/categories_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/home/home_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/products/products_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/onboarding_screen/ui/onboarding_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/order/bloc/order_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product/bloc/product_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/bloc/product_detail/product_detail_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/bloc/variants/variants_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/profile/bloc%20/profile_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/search/bloc/search_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/settings/bloc/language/language_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/settings/bloc/theme/theme_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/shipping_info/bloc/shipping_bloc.dart';

import 'managers/service_locator/di.dart';
import 'managers/theme/app_theme.dart';
import 'presentation/auth/login/bloc/login_bloc.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    const Duration(seconds: 4),
  );
  FlutterNativeSplash.remove();
  await EasyLocalization.ensureInitialized();
  setup();
  runApp(EasyLocalization(supportedLocales: const [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ], path: 'assets/translation', fallbackLocale: const Locale('en', 'US'), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<VariantsBloc>(),
        ),
        BlocProvider(
          create: (context) => ProductDetailBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<CartBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CheckOutBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<FavouriteBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ThemeBloc>()..add(LoadTheme()),
        ),
        BlocProvider(
          create: (context) => LanguageBloc()..add(LoadLanguage()),
        ),
        BlocProvider(
          create: (context) => getIt<OrderBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ShippingBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, child) {
            return BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, languageState) {
                return BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, themeState) {
                    return MaterialApp(
                      title: 'VMO Assignment Demo',
                      debugShowCheckedModeBanner: false,
                      locale: languageState.locale,
                      supportedLocales: context.supportedLocales,
                      localizationsDelegates: context.localizationDelegates,
                      theme: themeState.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
                      onGenerateRoute: generateRoute,
                      home: const OnboardingScreen(),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
