import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

import '../../../domain/cart/discount/entity/discount_entity.dart';
import '../../../managers/enum/enum.dart';
import '../../common/widgets/shimmer_widget.dart';
import '../bloc/cart_bloc.dart';

class VoucherSelectionDialogWidget extends StatelessWidget {
  const VoucherSelectionDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (prev, cur) => prev.discounts != cur.discounts,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return ShimmerWidget(
            height: 300.h,
            width: double.infinity.w,
          );
        } else if (state.status == Status.failure) {
          return Center(
            child: Text(context.tr("Failed to load vouchers")),
          );
        } else {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          context.tr("select_voucher"),
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300.h,
                    width: double.maxFinite,
                    child: Scrollbar(
                      interactive: true,
                      thumbVisibility: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.discounts.length,
                        itemBuilder: (context, index) {
                          return _buildVoucherItem(context, state.discounts[index]);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

Widget _buildVoucherItem(BuildContext context, DiscountDataEntity discount) {
  return GestureDetector(
    onTap: () {
      context.read<CartBloc>().add(ApplyVoucher(discount.code ?? ''));
      Navigator.of(context).pop();
    },
    child: Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  discount.code ?? '',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(context.tr("apply"), style: TextStyle(fontSize: 16.sp, color: Colors.green)),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    ),
  );
}
