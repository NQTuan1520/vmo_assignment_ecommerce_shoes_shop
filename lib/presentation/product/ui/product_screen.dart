import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

import '../bloc/product_bloc.dart';
import '../widgets/product_item_widget.dart';

class ProductsScreen extends StatefulWidget {
  static const String routeName = '/products';

  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProducts());
  }

  void _onLoading() {
    context.read<ProductBloc>().add(LoadMoreProducts());
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All_Products".tr()),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == Status.loading && state.productsData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == Status.failure) {
            return Center(child: Text(state.errorMessage ?? 'Failed to load products'));
          } else {
            return SmartRefresher(
              controller: _refreshController,
              enablePullUp: true,
              enablePullDown: false,
              onLoading: _onLoading,
              child: GridView.builder(
                padding: EdgeInsets.all(8.r),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: state.productsData.length,
                itemBuilder: (context, index) {
                  final product = state.productsData[index];
                  return ProductItemWidget(context: context, product: product);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
