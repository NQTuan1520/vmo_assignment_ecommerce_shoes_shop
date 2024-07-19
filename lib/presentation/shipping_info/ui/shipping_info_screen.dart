import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

import '../../common/widgets/toast_utils.dart';
import '../bloc/shipping_bloc.dart';

class ShippingInfoScreen extends StatefulWidget {
  const ShippingInfoScreen({super.key});

  static const String routeName = '/shipping_info';

  @override
  State<ShippingInfoScreen> createState() => _ShippingInfoScreenState();
}

class _ShippingInfoScreenState extends State<ShippingInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ShippingBloc>().add(FetchShippingInfoEvent());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _countryController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200.h,
            padding: EdgeInsets.only(top: 32.h),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.deepPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.local_shipping_rounded,
                          size: 40.r,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        _nameController.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: BlocListener<ShippingBloc, ShippingState>(
                listener: (context, state) {
                  if (state.status == Status.success) {
                    ToastUtils.showSuccessToast(message: context.tr("Shipping_info_saved_successfully"));
                  } else if (state.status == Status.failure) {
                    ToastUtils.showErrorToast(message: state.errorMessage ?? context.tr("Error_occurred"));
                  } else if (state.userStatus == Status.failure) {
                    ToastUtils.showErrorToast(message: state.errorMessage ?? context.tr("Error_occurred"));
                  } else if (state.userStatus == Status.success) {
                    ToastUtils.showSuccessToast(message: context.tr("Shipping_info_loaded_successfully"));
                  }
                },
                child: BlocBuilder<ShippingBloc, ShippingState>(
                  builder: (context, state) {
                    if (state.status == Status.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      _nameController.text = state.name ?? '';
                      _emailController.text = state.email ?? '';
                      _streetController.text = state.street ?? '';
                      _cityController.text = state.city ?? '';
                      _stateController.text = state.state ?? '';
                      _zipController.text = state.zip ?? '';
                      _countryController.text = state.country ?? '';
                      _phoneController.text = state.phone ?? '';

                      return ListView(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              labelText: context.tr("Name"),
                              labelStyle: TextStyle(fontSize: 18.sp),
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              labelText: context.tr("Email"),
                              labelStyle: TextStyle(fontSize: 18.sp),
                              prefixIcon: const Icon(Icons.email, color: Colors.blueAccent),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: _streetController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              labelText: context.tr("Street"),
                              labelStyle: TextStyle(fontSize: 18.sp),
                              prefixIcon: const Icon(Icons.location_on, color: Colors.redAccent),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: _cityController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              labelText: context.tr("City"),
                              labelStyle: TextStyle(fontSize: 18.sp),
                              prefixIcon: const Icon(Icons.location_city, color: Colors.green),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: _stateController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              labelText: context.tr("State"),
                              labelStyle: TextStyle(fontSize: 18.sp),
                              prefixIcon: const Icon(Icons.location_city, color: Colors.orange),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: _zipController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              labelText: context.tr("Postal_Code"),
                              labelStyle: TextStyle(fontSize: 18.sp),
                              prefixIcon: const Icon(Icons.location_city, color: Colors.purple),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: _countryController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              labelText: context.tr("Country"),
                              labelStyle: TextStyle(fontSize: 18.sp),
                              prefixIcon: const Icon(Icons.location_city, color: Colors.blue),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                              ),
                              labelText: context.tr("Phone"),
                              labelStyle: TextStyle(fontSize: 18.sp),
                              prefixIcon: const Icon(Icons.phone, color: Colors.amberAccent),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          SizedBox(height: 32.h),
                          Center(
                            child: Container(
                              width: 200.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                gradient: const LinearGradient(
                                  colors: [Colors.blue, Colors.deepPurple],
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  context.read<ShippingBloc>().add(UpdateShippingInfoEvent(
                                        name: _nameController.text,
                                        street: _streetController.text,
                                        city: _cityController.text,
                                        state: _stateController.text,
                                        zip: _zipController.text,
                                        country: _countryController.text,
                                        phone: _phoneController.text,
                                        email: _emailController.text,
                                      ));
                                },
                                child: Text(
                                  context.tr("Save_Shipping_Info"),
                                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
