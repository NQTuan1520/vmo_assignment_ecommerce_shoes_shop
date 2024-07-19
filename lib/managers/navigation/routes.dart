import 'package:flutter/material.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/login/ui/login_screen_provider.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/sign_up/ui/sign_up_screen_provider.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/ui/home_screen_provider.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/product_detail_args.dart';

import '../../presentation/all_product/ui/product_screen_provider.dart';
import '../../presentation/auth/forgot_password/ui/forgot_password_screen_provider.dart';
import '../../presentation/cart/ui/cart_screen_provider.dart';
import '../../presentation/check_out/checkout_args.dart';
import '../../presentation/check_out/ui/check_out_screen_provider.dart';
import '../../presentation/favourite/ui/favourite_screen_provider.dart';
import '../../presentation/main/ui/main_screen_provider.dart';
import '../../presentation/onboarding_screen/ui/onboarding_screen_provider.dart';
import '../../presentation/order/ui/order_screen_provider.dart';
import '../../presentation/product_detail/ui/product_detail_screen_provider.dart';
import '../../presentation/profile/ui/profile_screen_provider.dart';
import '../../presentation/search/ui/search_screen_provider.dart';
import '../../presentation/settings/ui/setting_screen_provider.dart';
import '../../presentation/shipping_info/ui/shipping_info_screen_provider.dart';
import '../../presentation/splash/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/splash':
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case '/onBoarding':
      return MaterialPageRoute(builder: (context) => const OnboardingScreenProvider());
    case '/main':
      return MaterialPageRoute(builder: (context) => const MainScreenProvider());
    case '/sign_up':
      return MaterialPageRoute(builder: (context) => const SignUpScreenProvider());
    case '/log_in':
      return MaterialPageRoute(builder: (context) => const LoginScreenProvider());
    case '/forgot_password':
      return MaterialPageRoute(builder: (context) => const ForgotPasswordScreenProvider());
    case '/home':
      return MaterialPageRoute(builder: (context) => const HomeScreenProvider());
    case '/favorites':
      return MaterialPageRoute(builder: (context) => const FavoriteScreenProvider());
    case '/cart':
      return MaterialPageRoute(builder: (context) => const CartScreenProvider());
    case '/profile':
      return MaterialPageRoute(builder: (context) => const ProfileScreenProvider());
    case '/product_detail':
      final args = settings.arguments as ProductDetailArgs;
      return MaterialPageRoute(
          builder: (context) => ProductDetailScreenProvider(
                product: args.product,
                showBottomSheet: args.showBottomSheet,
              ));
    case '/checkout':
      final args = settings.arguments as CheckoutArgs;
      return MaterialPageRoute(builder: (context) => CheckOutScreenProvider(checkoutToken: args.checkoutToken));
    case '/search':
      return MaterialPageRoute(builder: (context) => const SearchScreenProvider());
    case '/products':
      return MaterialPageRoute(builder: (context) => const ProductScreenProvider());
    case '/settings':
      return MaterialPageRoute(builder: (context) => const SettingScreenProvider());
    case '/order':
      return MaterialPageRoute(builder: (context) => const OrderScreenProvider());
    case '/shipping_info':
      return MaterialPageRoute(builder: (context) => const ShippingInfoScreenProvider());
    default:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
  }
}
