import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/cart/cart_details/entity/cart_entity.dart';
import '../bloc/cart_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemEntity cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    String? size;
    String? color;

    cartItem.selectedOptions?.forEach((option) {
      if (option.groupName?.toLowerCase() == 'size') {
        size = option.optionName;
      } else if (option.groupName?.toLowerCase() == 'color') {
        color = option.optionName;
      }
    });

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              cartItem.image?.url ?? '',
              width: 120.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.name ?? '',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text(
                  '\$${cartItem.price?.formatted ?? ''}',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 4.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (size != null) Text('${"size".tr()}: $size', style: TextStyle(fontSize: 14.sp)),
                    if (color != null) Text('${"color".tr()}: $color', style: TextStyle(fontSize: 14.sp)),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        context.read<CartBloc>().add(DecreaseQuantity(cartItem));
                      },
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      buildWhen: (prev, cur) => prev.cartItems != cur.cartItems,
                      builder: (context, state) {
                        final updatedCartItems = state.cartItems.firstWhere((item) => item.id == cartItem.id);
                        return Text(
                          updatedCartItems.quantity.toString(),
                          style: TextStyle(fontSize: 16.sp),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        context.read<CartBloc>().add(IncreaseQuantity(cartItem));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            iconSize: 32.sp,
            onPressed: () {
              _showDialogConfirmation(context, cartItem);
            },
          ),
        ],
      ),
    );
  }

  void _showDialogConfirmation(BuildContext context, CartItemEntity cartItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("delete_item".tr()),
          content: Text("delete_item_confirmation".tr()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("cancel".tr()),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<CartBloc>().add(RemoveCartItems(cartItem));
              },
              child: Text("delete".tr()),
            ),
          ],
        );
      },
    );
  }
}
