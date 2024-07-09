import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/cart/widget/voucher_selection_dialog_widget.dart';

import '../../../managers/colors/colors.dart';
import '../../../managers/enum/enum.dart';
import '../../common/animation/fade_animation.dart';
import '../../common/widgets/custom_button_widget.dart';
import '../../common/widgets/shimmer_widget.dart';
import '../bloc/cart_bloc.dart';

class SummerySectionWidget extends StatelessWidget {
  final CartState state;
  final MyColorTheme colorTheme;

  const SummerySectionWidget({super.key, required this.state, required this.colorTheme});

  @override
  Widget build(BuildContext context) {
    final totalCost = state.cart?.subtotal?.raw ?? 0;
    final discount = state.voucher?.discount?.amountSaved?.raw ?? 0;

    final double finalTotalCost = totalCost - discount;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final bool isCartEmpty = state.cartItems.isEmpty;
        final bool isLoading = state.checkoutTokenStatus == Status.loading;

        return FadeAnimation(
          0.3,
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border(
                top: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
            child: Column(
              children: [
                // Voucher selection section
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await _showVoucherSelectionDialog(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: state.voucher?.discount != null ? Colors.blue : Colors.grey),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            state.voucher?.discount != null ? state.voucher?.discount?.code ?? '' : "Select Voucher",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "total_cost".tr(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    state.checkDiscount
                        ? ShimmerWidget(
                            height: 20.h,
                            width: 80.w,
                          )
                        : Text(
                            '\$${state.cart?.subtotal?.raw ?? 0.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
                if (state.voucher?.discount != null) SizedBox(height: 16.h),
                if (state.voucher?.discount != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "discount".tr(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '-\$${discount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (state.voucher?.discount != null) SizedBox(height: 16.h),
                if (state.voucher?.discount != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "final_total_cost".tr(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${finalTotalCost.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 16.h),
                CustomButtonWidget(
                  height: 50.h,
                  width: double.infinity.w,
                  color: isCartEmpty || isLoading ? Colors.grey : colorTheme.blueButton,
                  textButton: isLoading ? "loading".tr() : "checkout".tr(),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  onTap: isCartEmpty || isLoading
                      ? null
                      : () {
                          context.read<CartBloc>().add(GetCheckOutToken());
                        },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showVoucherSelectionDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const VoucherSelectionDialogWidget();
      },
    );
  }
}
