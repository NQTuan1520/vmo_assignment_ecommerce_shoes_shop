import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/error_layout_widgets.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/widgets/carousel_slider_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/widgets/category_list.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/widgets/menu_screen.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/widgets/sliver_app_bar_custom_widget.dart';

import '../../../managers/utils/login_ui_helpers.dart';
import '../../common/global/global_internet_wrap.dart';
import '../bloc/categories/categories_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/products/products_bloc.dart';
import '../widgets/product_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  final MyColorTheme colorTheme = MyColorTheme();
  final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);
    _scrollController.addListener(_onScroll);

    _onFetchData();
  }

  void _onFetchData() {
    context.read<CategoriesBloc>().add(GetCategories());
    context.read<ProductsBloc>().add(GetProducts());
    context.read<HomeBloc>().add(GetProfileUser());
  }

  void _listenToScrollChange() {
    final isScrolled = _scrollController.offset >= 100.0;
    context.read<HomeBloc>().add(UpdateScrollPosition(isScrolled));
  }

  void _onMenuItemClicked(int index) {
    _zoomDrawerController.close?.call(); // Close drawer
    switch (index) {
      case 0:
        LoginUIHelpers.checkLoginStatusAndPrompt(context, '/profile', null);
        break;
      case 1:
        LoginUIHelpers.checkLoginStatusAndPrompt(context, '/cart', null);
        break;
      case 2:
        LoginUIHelpers.checkLoginStatusAndPrompt(context, '/favorites', null);
        break;
      case 3:
        LoginUIHelpers.checkLoginStatusAndPrompt(context, '/order', null);
        break;
      case 4:
        Navigator.pushNamed(context, '/settings');
        break;
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<ProductsBloc>().add(LoadMoreProducts());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlobalConnectivityWrapper(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ZoomDrawer(
            borderRadius: 24.r,
            showShadow: true,
            angle: -12.0,
            menuBackgroundColor: const Color(0xFF1A1A2E),
            controller: _zoomDrawerController,
            menuScreen: MenuScreen(
              onMenuItemClicked: _onMenuItemClicked,
              profileName: state.name ?? '',
            ),
            mainScreenTapClose: true,
            mainScreen: Scaffold(
              body: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (prev, cur) => prev.isScrolled != cur.isScrolled,
                    builder: (context, state) {
                      return SliverAppBarCustomWidget(
                          isScrolled: state.isScrolled,
                          zoomDrawerController: _zoomDrawerController,
                          checkLoginStatusAndPrompt: (context) {
                            LoginUIHelpers.checkLoginStatusAndPrompt(context, '/cart', null);
                          });
                    },
                  ),
                  BlocBuilder<CategoriesBloc, CategoriesState>(
                    buildWhen: (prev, cur) =>
                        prev.status != cur.status || prev.selectedCategory != cur.selectedCategory,
                    builder: (context, state) {
                      if (state.status == Status.loading) {
                        return const SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (state.status == Status.failure) {
                        return SliverFillRemaining(
                          child: ErrorLayoutWidget(
                            tap: () {
                              _onFetchData();
                            },
                            message: context.tr("Try to reload"),
                          ),
                        );
                      } else if (state.status == Status.success) {
                        return CategoryList(
                          categories: state.categoriesData,
                          selectedCategory: state.selectedCategory,
                        );
                      } else {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text(context.tr('No categories available')),
                          ),
                        );
                      }
                    },
                  ),
                  BlocBuilder<ProductsBloc, ProductsState>(
                    buildWhen: (prev, cur) => prev.status != cur.status || prev.productsData != cur.productsData,
                    builder: (context, state) {
                      if (state.status == Status.loading) {
                        return const SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (state.status == Status.failure) {
                        return SliverFillRemaining(
                          child: Center(child: Text('${context.tr("Failed to load products")} ${state.errorMessage}')),
                        );
                      } else if (state.status == Status.success) {
                        return ProductListWidget(
                          products: state.selectedProduct,
                        );
                      } else {
                        return SliverToBoxAdapter(
                          child: Center(child: Text(context.tr("No products available"))),
                        );
                      }
                    },
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 30.h),
                  ),
                  const SliverToBoxAdapter(
                    child: CarouselSliderWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 50.h),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenToScrollChange);
    _scrollController.dispose();
    super.dispose();
  }
}
