import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/cart/discount/repository/discount_repository_impl.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/check_out/api/check_out_api_service.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/categories/api/categories_api_service.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/categories/repository/categories_repository_impl.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/products/api/products_api_service.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/data/home/products/repository/product_repository_impl.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/auth/repository/auth_repository.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/auth/usecase/auth_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/cart/discount/repository/discount_repository.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/cart/discount/usecase/discount_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/repository/category_repository.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/usecase/categories_usecase.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/connectivity/connectivity_manager.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/const/const.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/dio/dio_factory.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/login/bloc/login_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/cart/bloc/cart_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/check_out/bloc/check_out_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/connectivity/connectivity_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/home/home_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/order/bloc/order_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/profile/bloc%20/profile_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/search/bloc/search_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/settings/bloc/language/language_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/shipping_info/bloc/shipping_bloc.dart';

import '../../data/auth/repository/auth_repository_impl.dart';
import '../../data/cart/cart_details/api/cart_api_service.dart';
import '../../data/cart/cart_details/repository/cart_repository_impl.dart';
import '../../data/cart/discount/api/discount_api_service.dart';
import '../../data/check_out/repository/check_out_repository_impl.dart';
import '../../data/order/api/order_api_service.dart';
import '../../data/order/repository/order_repository_impl.dart';
import '../../domain/cart/cart_details/repository/cart_repository.dart';
import '../../domain/cart/cart_details/usecase/cart_usecase.dart';
import '../../domain/check_out/repository/check_out_repository.dart';
import '../../domain/check_out/usecase/check_out_usecase.dart';
import '../../domain/home/products/products_detail/repository/product_repository.dart';
import '../../domain/home/products/products_detail/usecase/products_usecase.dart';
import '../../domain/order/repository/order_repository.dart';
import '../../domain/order/usecase/order_usecase.dart';
import '../../presentation/favourite/bloc/favourite_bloc.dart';
import '../../presentation/home/bloc/categories/categories_bloc.dart';
import '../../presentation/home/bloc/products/products_bloc.dart';
import '../../presentation/product/bloc/product_bloc.dart';
import '../../presentation/product_detail/bloc/variants/variants_bloc.dart';
import '../../presentation/settings/bloc/theme/theme_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  // Register DioFactory
  getIt.registerLazySingleton<DioFactory>(() => DioFactory(AppConstants.baseUrl));

  // Register Dio using DioFactory
  getIt.registerLazySingleton<Dio>(() => getIt<DioFactory>().create());

  // Register Firestore
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  //Register Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Register Product API service
  getIt.registerLazySingleton<ProductsApiService>(
    () => ProductsApiService(getIt<Dio>(), baseUrl: AppConstants.baseUrl),
  );

  // Register Product repositories

  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
        getIt<ProductsApiService>(),
        getIt<FirebaseFirestore>(),
      ));

  getIt.registerSingleton<ConnectivityManager>(ConnectivityManager());

  // Register Product use cases
  getIt.registerSingleton<ProductsUseCase>(ProductsUseCase(getIt<ProductRepository>()));

  // Register Categories API service
  getIt.registerLazySingleton<CategoriesApiService>(
    () => CategoriesApiService(getIt<Dio>(), baseUrl: AppConstants.baseUrl),
  );

  // Register Categories repositories
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoriesRepositoryImpl(getIt<CategoriesApiService>()),
  );

  // Register Categories use cases
  getIt.registerSingleton<CategoriesUseCase>(CategoriesUseCase(getIt<CategoryRepository>()));

  //Register Cart API service
  getIt.registerLazySingleton<CartApiService>(
    () => CartApiService(getIt<Dio>(), baseUrl: AppConstants.baseUrl),
  );

  //Register Cart repository
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(getIt<CartApiService>()),
  );

  //Register Cart use case
  getIt.registerSingleton<CartUseCase>(
    CartUseCase(getIt<CartRepository>()),
  );

  //Register Discount API service
  getIt.registerLazySingleton<DiscountApiService>(
    () => DiscountApiService(getIt<Dio>(), baseUrl: AppConstants.baseUrl),
  );

  //Register Discount repository
  getIt.registerLazySingleton<DiscountRepository>(
    () => DiscountRepositoryImpl(getIt<DiscountApiService>()),
  );

  //Register Discount use case
  getIt.registerSingleton<DiscountUseCase>(
    DiscountUseCase(getIt<DiscountRepository>()),
  );

  //Register CheckOut API service
  getIt.registerLazySingleton<CheckOutApiService>(
    () => CheckOutApiService(getIt<Dio>(), baseUrl: AppConstants.baseUrl),
  );

  //Register CheckOut repository
  getIt.registerLazySingleton<CheckOutRepository>(
    () => CheckOutRepositoryImpl(getIt<CheckOutApiService>()),
  );

  //Register CheckOut use case
  getIt.registerSingleton<CheckOutUseCase>(
    CheckOutUseCase(getIt<CheckOutRepository>()),
  );

  //Register Order API service
  getIt.registerLazySingleton<OrderApiService>(
    () => OrderApiService(getIt<Dio>(), baseUrl: AppConstants.baseUrl),
  );

  //Register Order repository
  getIt.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(getIt<OrderApiService>()),
  );

  //Register Order use case
  getIt.registerSingleton<OrderUseCase>(
    OrderUseCase(getIt<OrderRepository>()),
  );

  // Register Auth repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<FirebaseAuth>(),
      getIt<FirebaseFirestore>(),
    ),
  );

  //Register Auth UseCase
  getIt.registerSingleton<AuthUseCase>(
    AuthUseCase(getIt<AuthRepository>()),
  );

  // Register blocs
  getIt.registerFactory<ProductsBloc>(
    () => ProductsBloc(productsUseCase: getIt<ProductsUseCase>()),
  );

  getIt.registerFactory<CategoriesBloc>(
    () => CategoriesBloc(
      categoriesUseCase: getIt<CategoriesUseCase>(),
    ),
  );

  getIt.registerFactory<VariantsBloc>(
    () => VariantsBloc(
      variantUseCase: getIt<ProductsUseCase>(),
      categoriesUseCase: getIt<CategoriesUseCase>(),
      cartUseCase: getIt<CartUseCase>(),
    ),
  );

  getIt.registerFactory<CartBloc>(
    () => CartBloc(
      cartUseCase: getIt<CartUseCase>(),
      discountUseCase: getIt<DiscountUseCase>(),
      checkOutUseCase: getIt<CheckOutUseCase>(),
    ),
  );

  getIt.registerFactory<CheckOutBloc>(
    () => CheckOutBloc(
      checkOutUseCase: getIt<CheckOutUseCase>(),
    ),
  );

  getIt.registerFactory<FavouriteBloc>(
    () => FavouriteBloc(
      productsUseCase: getIt<ProductsUseCase>(),
      auth: getIt<FirebaseAuth>(),
    ),
  );

  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(
      productsUseCase: getIt<ProductsUseCase>(),
    ),
  );

  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      productsUseCase: getIt<ProductsUseCase>(),
    ),
  );

  getIt.registerFactory<ThemeBloc>(
    () => ThemeBloc(
      firestore: getIt<FirebaseFirestore>(),
      auth: getIt<FirebaseAuth>(),
    ),
  );

  getIt.registerFactory<OrderBloc>(
    () => OrderBloc(
      orderUseCase: getIt<OrderUseCase>(),
    ),
  );

  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      firebaseAuth: getIt<FirebaseAuth>(),
      firebaseFirestore: getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(
      firebaseAuth: getIt<FirebaseAuth>(),
      firebaseFirestore: getIt<FirebaseFirestore>(),
      authUseCase: getIt<AuthUseCase>(),
    ),
  );

  getIt.registerFactory<ShippingBloc>(
    () => ShippingBloc(
      getIt<FirebaseAuth>(),
      getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      authUseCase: getIt<AuthUseCase>(),
    ),
  );

  getIt.registerFactory<ForgotPasswordBloc>(
    () => ForgotPasswordBloc(
      authUseCase: getIt<AuthUseCase>(),
    ),
  );

  getIt.registerFactory<SignUpBloc>(
    () => SignUpBloc(
      authUseCase: getIt<AuthUseCase>(),
    ),
  );

  getIt.registerFactory<LanguageBloc>(
    () => LanguageBloc(),
  );

  getIt.registerFactory<ConnectivityBloc>(
    () => ConnectivityBloc(
      connectivityManager: getIt<ConnectivityManager>(),
    ),
  );
}
