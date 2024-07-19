import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/cart/widget/cart_item_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/animation/fade_animation.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/custom_back_button.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/shimmer_widget.dart';

import '../../../managers/colors/colors.dart';
import '../../../managers/enum/enum.dart';
import '../../check_out/checkout_args.dart';
import '../../common/widgets/error_layout_widgets.dart';
import '../bloc/cart_bloc.dart';
import '../widget/summery_section_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  static const String routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _colorTheme = MyColorTheme();

  @override
  void initState() {
    super.initState();
    _fetchCartDetails();
  }

  void _fetchCartDetails() {
    context.read<CartBloc>().add(FetchCartDetails());
    context.read<CartBloc>().add(FetchDiscounts());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(context.tr("My_Cart")),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CustomBackButton()),
          ),
          body: BlocListener<CartBloc, CartState>(
            listenWhen: (prev, cur) => prev.checkoutTokenStatus != cur.checkoutTokenStatus,
            listener: (context, state) {
              if (state.checkoutTokenStatus == Status.success && state.tokenCheckOut != null) {
                Navigator.pushNamed(
                  context,
                  '/checkout',
                  arguments: CheckoutArgs(checkoutToken: state.tokenCheckOut!),
                );
              }
            },
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state.status == Status.loading || state.updateStatus == Status.loading) {
                  return Center(
                    child: ShimmerWidget(
                      height: double.infinity.h,
                      width: double.infinity.w,
                    ),
                  );
                } else if (state.status == Status.success) {
                  return Column(
                    children: [
                      Expanded(
                        child: state.cartItems.isEmpty
                            ? Center(
                                child: Text(context.tr("no_item_in_cart")),
                              )
                            : FadeAnimation(
                                1.0,
                                ListView.builder(
                                  itemCount: state.cartItems.length,
                                  itemBuilder: (context, index) {
                                    final cartItem = state.cartItems[index];
                                    return CartItemWidget(cartItem: cartItem);
                                  },
                                ),
                              ),
                      ),
                      SummerySectionWidget(state: state, colorTheme: _colorTheme)
                    ],
                  );
                } else if (state.status == Status.failure) {
                  return ErrorLayoutWidget(
                    tap: () {
                      _fetchCartDetails();
                    },
                    message: state.errorMessage ?? '',
                  );
                } else {
                  return const Center(
                    child: Text('Unknown state.'),
                  );
                }
              },
            ),
          ),
        ),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.checkoutTokenStatus == Status.loading) {
              return Container(
                color: Colors.white.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
