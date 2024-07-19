import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

import '../../../domain/order/entity/order_entity.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderDataEntity order;

  static const routeName = '/order_details';

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr("Order_Details"),
          style: TextStyle(fontSize: 22.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context.tr("Items")),
            SizedBox(height: 8.h),
            _buildOrderItems(context),
            SizedBox(height: 16.h),
            _buildSectionTitle(context.tr("Order_Information")),
            SizedBox(height: 8.h),
            _buildOrderInfo(context),
            SizedBox(height: 16.h),
            _buildSectionTitle(context.tr("Customer_Information")),
            SizedBox(height: 8.h),
            _buildCustomerInfo(context),
            SizedBox(height: 16.h),
            _buildSectionTitle(context.tr("Shipping_Information")),
            SizedBox(height: 8.h),
            _buildShippingInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.blueGrey),
    );
  }

  Widget _buildOrderInfo(BuildContext context) {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(context.tr("Order_ID"), order.id ?? ''),
          _buildInfoRow(context.tr("Status"), order.status ?? ''),
          _buildInfoRow(context.tr("Created"),
              DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(order.created! * 1000))),
          _buildInfoRow(context.tr("Total"), order.orderValue?.formatted ?? ''),
        ],
      ),
    );
  }

  Widget _buildCustomerInfo(BuildContext context) {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(context.tr("Customer"), '${order.customer?.firstName} ${order.customer?.lastName}'),
          _buildInfoRow(context.tr("Email"), order.customer?.email ?? ''),
          _buildInfoRow(context.tr("Phone"), order.customer?.phone ?? ''),
        ],
      ),
    );
  }

  Widget _buildShippingInfo(BuildContext context) {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(context.tr("Name"), order.shipping?.name ?? ''),
          _buildInfoRow(context.tr("Street"), order.shipping?.street ?? ''),
          _buildInfoRow(context.tr("City"), order.shipping?.townCity ?? ''),
          _buildInfoRow(context.tr("State"), order.shipping?.countyState ?? ''),
          _buildInfoRow(context.tr("Postal_Code"), order.shipping?.postalZipCode ?? ''),
          _buildInfoRow(context.tr("Country"), order.shipping?.country ?? ''),
        ],
      ),
    );
  }

  Widget _buildOrderItems(BuildContext context) {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: order.order?.lineItems?.map((item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    if (item.image?.url != null) ...[
                      CachedNetworkImage(
                        imageUrl: item.image!.url!,
                        height: 150.h,
                        width: 150.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10.w),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${item.productName}', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                          Text('${context.tr("Price")}: ${item.price?.formattedWithSymbol}',
                              style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                          Text(
                            '${context.tr("Quantity")}: ${item.quantity}',
                            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Widget child) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: child,
      ),
    );
  }
}
