import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/order/entity/order_entity.dart';
import '../ui/order_details_screen.dart';

class OrderCardWidget extends StatelessWidget {
  final BuildContext context;
  final OrderDataEntity order;

  const OrderCardWidget({super.key, required this.context, required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(order: order),
          ),
        );
      },
      child: Card(
        elevation: 3.0,
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderHeader(order),
              SizedBox(height: 8.h),
              _buildOrderDetails(order),
              SizedBox(height: 8.h),
              const Divider(),
              _buildOrderItems(order),
              SizedBox(height: 8.h),
              _buildCustomerInfo(order),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderHeader(OrderDataEntity order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${"Order_ID".tr()}${order.id}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        Text(
          '${"Status".tr()} ${order.status}',
          style: TextStyle(
            color: order.status == 'open' ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetails(OrderDataEntity order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${"Created".tr()} ${DateTime.fromMillisecondsSinceEpoch(order.created! * 1000)}',
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          "${"Total".tr()}: ${order.orderValue?.formatted}\$",
          style: TextStyle(fontSize: 14.sp),
        ),
      ],
    );
  }

  Widget _buildOrderItems(OrderDataEntity order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Items".tr(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        ...?order.order?.lineItems?.map(
          (item) => Row(
            children: [
              if (item.image?.url != null) ...[
                Image.network(
                  item.image!.url!,
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10.w),
              ],
              Expanded(
                child: Text(
                  '${item.quantity} x ${item.productName}',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerInfo(OrderDataEntity order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${"Customer".tr()} ${order.customer?.firstName} ${order.customer?.lastName}',
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          '${"Email".tr()} ${order.customer?.email}',
          style: TextStyle(fontSize: 14.sp),
        ),
      ],
    );
  }
}
