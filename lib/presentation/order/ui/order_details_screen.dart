import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          "Order_Details".tr(),
          style: TextStyle(fontSize: 22.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Items".tr()),
            SizedBox(height: 8.h),
            _buildOrderItems(),
            SizedBox(height: 16.h),
            _buildSectionTitle("Order_Information".tr()),
            SizedBox(height: 8.h),
            _buildOrderInfo(),
            SizedBox(height: 16.h),
            _buildSectionTitle("Customer_Information".tr()),
            SizedBox(height: 8.h),
            _buildCustomerInfo(),
            SizedBox(height: 16.h),
            _buildSectionTitle("Shipping_Information".tr()),
            SizedBox(height: 8.h),
            _buildShippingInfo(),
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

  Widget _buildOrderInfo() {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Order_ID".tr(), order.id ?? ''),
          _buildInfoRow("Status".tr(), order.status ?? ''),
          _buildInfoRow(
              "Created".tr(), DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(order.created! * 1000))),
          _buildInfoRow("Total".tr(), order.orderValue?.formatted ?? ''),
        ],
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Customer".tr(), '${order.customer?.firstName} ${order.customer?.lastName}'),
          _buildInfoRow("Email".tr(), order.customer?.email ?? ''),
          _buildInfoRow("Phone".tr(), order.customer?.phone ?? ''),
        ],
      ),
    );
  }

  Widget _buildShippingInfo() {
    return _buildCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Name".tr(), order.shipping?.name ?? ''),
          _buildInfoRow("Street".tr(), order.shipping?.street ?? ''),
          _buildInfoRow("City".tr(), order.shipping?.townCity ?? ''),
          _buildInfoRow("State".tr(), order.shipping?.countyState ?? ''),
          _buildInfoRow("Postal_Code".tr(), order.shipping?.postalZipCode ?? ''),
          _buildInfoRow("Country".tr(), order.shipping?.country ?? ''),
        ],
      ),
    );
  }

  Widget _buildOrderItems() {
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
                          Text('${"Price".tr()}: ${item.price?.formattedWithSymbol}',
                              style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                          Text(
                            '${"Quantity".tr()}: ${item.quantity}',
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
