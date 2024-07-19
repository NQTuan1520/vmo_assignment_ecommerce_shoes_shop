import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/error_layout_widgets.dart';

import '../bloc/order_bloc.dart';
import '../widgets/order_card_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  static const routeName = '/order';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetOrder());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr("Orders"),
          style: TextStyle(fontSize: 22.sp),
        ),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == Status.failure) {
            return ErrorLayoutWidget(
              tap: () {
                context.read<OrderBloc>().add(GetOrder());
              },
              message: state.errorMessage ?? '',
            );
          } else if (state.status == Status.success && state.orders.isEmpty) {
            return Center(child: Text(context.tr("No_orders_available")));
          } else if (state.status == Status.success) {
            return ListView.builder(
              padding: EdgeInsets.all(8.r),
              itemCount: state.orders.length,
              itemBuilder: (context, index) {
                final order = state.orders[index];
                return OrderCardWidget(context: context, order: order);
              },
            );
          } else {
            return Center(child: Text(context.tr("Something_went_wrong")));
          }
        },
      ),
    );
  }
}
