import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/navigation/routes.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/cart/bloc/cart_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/home/home_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/onboarding_screen/ui/onboarding_screen_provider.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/bloc/variants/variants_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/settings/bloc/language/language_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/settings/bloc/theme/theme_bloc.dart';

import 'managers/service_locator/di.dart';
import 'managers/theme/app_theme.dart';

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
          create: (context) => getIt<ThemeBloc>()..add(LoadTheme()),
        ),
        BlocProvider(
          create: (context) => getIt<LanguageBloc>()..add(LoadLanguage()),
        ),
        BlocProvider(
          create: (context) => getIt<VariantsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CartBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
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
                      home: const OnboardingScreenProvider(),
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
