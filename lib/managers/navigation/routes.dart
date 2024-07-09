import 'package:flutter/material.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/login/ui/login_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/cart/ui/cart_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/favourite/ui/favourite_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/ui/home_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/main/ui/main_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/onboarding_screen/ui/onboarding_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/product_detail_args.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/ui/product_detail_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/profile/ui/profile_screen.dart';

import '../../presentation/auth/forgot_password/ui/forgot_password_screen.dart';
import '../../presentation/auth/sign_up/ui/sign_up_screen.dart';
import '../../presentation/check_out/checkout_args.dart';
import '../../presentation/check_out/ui/check_out_screen.dart';
import '../../presentation/order/ui/order_screen.dart';
import '../../presentation/product/ui/product_screen.dart';
import '../../presentation/search/ui/search_screen.dart';
import '../../presentation/settings/ui/settings_screen.dart';
import '../../presentation/shipping_info/ui/shipping_info_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/onBoarding':
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());
    case '/main':
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case '/sign_up':
      return MaterialPageRoute(builder: (context) => const SignUpScreen());
    case '/log_in':
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case '/forgot_password':
      return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());
    case '/home':
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case '/favorites':
      return MaterialPageRoute(builder: (context) => const FavouritesScreen());
    case '/cart':
      return MaterialPageRoute(builder: (context) => const CartScreen());
    case '/profile':
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    case '/product_detail':
      final args = settings.arguments as ProductDetailArgs;
      return MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
                product: args.product,
                showBottomSheet: args.showBottomSheet,
              ));
    case '/checkout':
      final args = settings.arguments as CheckoutArgs;
      return MaterialPageRoute(builder: (context) => CheckOutScreen(checkoutToken: args.checkoutToken));
    case '/search':
      return MaterialPageRoute(builder: (context) => const SearchScreen());
    case '/products':
      return MaterialPageRoute(builder: (context) => const ProductsScreen());
    case '/settings':
      return MaterialPageRoute(builder: (context) => const SettingsScreen());
    case '/order':
      return MaterialPageRoute(builder: (context) => const OrderScreen());
    case '/shipping_info':
      return MaterialPageRoute(builder: (context) => const ShippingInfoScreen());
    default:
      return MaterialPageRoute(builder: (context) => const MainScreen());
  }
}
