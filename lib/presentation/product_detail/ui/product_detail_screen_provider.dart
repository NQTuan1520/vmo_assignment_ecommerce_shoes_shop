import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/service_locator/di.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/product_detail/ui/product_detail_screen.dart';

import '../../../domain/home/products/products_detail/entity/product_data_entity.dart';
import '../../favourite/bloc/favourite_bloc.dart';
import '../bloc/product_detail/product_detail_bloc.dart';

class ProductDetailScreenProvider extends StatelessWidget {
  final ProductDataEntity product;
  final bool showBottomSheet;

  static const String routeName = '/product_detail';

  const ProductDetailScreenProvider({super.key, required this.product, this.showBottomSheet = false});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductDetailBloc(),
        ),
      ],
      child: ProductDetailScreen(product: product, showBottomSheet: showBottomSheet),
    );
  }
}
