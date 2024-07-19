import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/check_out/widget/payment_card_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/check_out/widget/section_title_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/check_out/widget/text_form_field_custom_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/custom_button_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/toast_utils.dart';

import '../../../data/check_out/request/capture_order_request.dart';
import '../../../domain/check_out/entity/get_token_check_out_entity.dart';
import '../../../managers/colors/colors.dart';
import '../../../managers/enum/enum.dart';
import '../../cart/bloc/cart_bloc.dart';
import '../../shipping_info/bloc/shipping_bloc.dart';
import '../bloc/check_out_bloc.dart';

class CheckOutScreen extends StatefulWidget {
  final GetTokenCheckOutEntity checkoutToken;

  const CheckOutScreen({super.key, required this.checkoutToken});

  static const String routeName = '/checkout';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final _colorTheme = MyColorTheme();
  final _formKey = GlobalKey<FormState>();

  // Add controllers for form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _countryController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryMonthController = TextEditingController();
  final _expiryYearController = TextEditingController();
  final _cvcController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ShippingBloc>().add(FetchShippingInfoEvent());
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _countryController.dispose();
    _cardNumberController.dispose();
    _expiryMonthController.dispose();
    _expiryYearController.dispose();
    _cvcController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckOutBloc, CheckOutState>(
      listenWhen: (prev, cur) =>
          prev.showSuccessDialog != cur.showSuccessDialog ||
          prev.status != cur.status ||
          prev.errorMessage != cur.errorMessage,
      listener: _blocListener,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(context.tr("checkout")),
            ),
            body: BlocBuilder<ShippingBloc, ShippingState>(
              builder: (context, shippingState) {
                if (shippingState.status == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (shippingState.status == Status.failure) {
                  return Center(child: Text(shippingState.errorMessage ?? 'Error occurred'));
                } else {
                  _setShippingInfo(shippingState);
                  return Padding(
                    padding: EdgeInsets.all(16.0.r),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          SectionTitleWidget(title: context.tr("shipping_info")),
                          SizedBox(height: 16.h),
                          TextFormFieldCustomWidget(
                              controller: _nameController,
                              labelText: context.tr("ship_name"),
                              icon: Icons.person,
                              errorText: "ship_name_error"),
                          TextFormFieldCustomWidget(
                              controller: _emailController,
                              labelText: context.tr("ship_email"),
                              icon: Icons.email,
                              errorText: context.tr("ship_email_error")),
                          TextFormFieldCustomWidget(
                              controller: _phoneController,
                              labelText: context.tr("ship_phone"),
                              icon: Icons.phone,
                              errorText: context.tr("ship_phone_error"),
                              keyboardType: TextInputType.phone),
                          TextFormFieldCustomWidget(
                              controller: _streetController,
                              labelText: context.tr("ship_street"),
                              icon: Icons.home,
                              errorText: context.tr("ship_street_error")),
                          TextFormFieldCustomWidget(
                              controller: _cityController,
                              labelText: context.tr("ship_city"),
                              icon: Icons.location_city,
                              errorText: context.tr("ship_city_error")),
                          TextFormFieldCustomWidget(
                              controller: _stateController,
                              labelText: context.tr("ship_state"),
                              icon: Icons.location_city,
                              errorText: context.tr("ship_state_error")),
                          TextFormFieldCustomWidget(
                            controller: _zipController,
                            labelText: context.tr("ship_postal_code"),
                            icon: Icons.location_city,
                            errorText: context.tr("ship_postal_code_error"),
                          ),
                          TextFormFieldCustomWidget(
                              controller: _countryController,
                              labelText: context.tr("ship_country"),
                              icon: Icons.location_city,
                              errorText: context.tr("ship_country_error")),
                          SizedBox(height: 16.h),
                          SectionTitleWidget(title: context.tr("payment_information")),
                          SizedBox(height: 16.h),
                          PaymentCardWidget(
                            cardNumberController: _cardNumberController,
                            expiryMonthController: _expiryMonthController,
                            expiryYearController: _expiryYearController,
                            cvcController: _cvcController,
                            colorTheme: _colorTheme,
                          ),
                          SizedBox(height: 24.h),
                          CustomButtonWidget(
                            height: 50.h,
                            width: double.infinity,
                            color: _colorTheme.blueButton,
                            textButton: context.tr("place_order"),
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            onTap: _onPlaceOrderTapped,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          BlocBuilder<CheckOutBloc, CheckOutState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
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
      ),
    );
  }

  void _blocListener(BuildContext context, CheckOutState state) {
    if (state.status == Status.loading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
    }
    if (state.showSuccessDialog) {
      _showSuccessDialog();
    } else if (state.status == Status.failure && state.errorMessage != null) {
      ToastUtils.showErrorToast(message: "${context.tr("Order Failed")} ${state.errorMessage!}");
      Navigator.pushReplacementNamed(context, "/main");
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 60.sp),
              SizedBox(height: 16.h),
              Text(context.tr("success")),
            ],
          ),
          content: Text(context.tr("order_success")),
          actions: <Widget>[
            TextButton(
              onPressed: _onGoToHome,
              child: Text(context.tr("go_to_home")),
            ),
          ],
        );
      },
    );
  }

  void _onGoToHome() {
    context.read<CheckOutBloc>().add(ResetCheckOut());
    context.read<CartBloc>().add(ResetCart());
    Navigator.pushNamedAndRemoveUntil(context, '/main', (Route<dynamic> route) => false);
  }

  void _setShippingInfo(ShippingState shippingState) {
    _nameController.text = shippingState.name ?? '';
    _streetController.text = shippingState.street ?? '';
    _cityController.text = shippingState.city ?? '';
    _stateController.text = shippingState.state ?? '';
    _zipController.text = shippingState.zip ?? '';
    _countryController.text = shippingState.country ?? '';
    _phoneController.text = shippingState.phone ?? '';
    _emailController.text = shippingState.email ?? '';
  }

  void _onPlaceOrderTapped() {
    if (_formKey.currentState!.validate()) {
      _showDialogCheckOut();
    }
  }

  void _showDialogCheckOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.tr("confirm_order")),
          content: Text(context.tr("order_confirmation")),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.tr("cancel")),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _placeOrder();
              },
              child: Text(context.tr("confirm")),
            ),
          ],
        );
      },
    );
  }

  void _placeOrder() {
    final orderRequest = CaptureOrderRequest(
      shipping: ShippingRequest(
        name: _nameController.text,
        street: _streetController.text,
        townCity: _cityController.text,
        countyState: _stateController.text,
        postalZipCode: _zipController.text,
        country: _countryController.text,
      ),
      customer: CustomerRequest(
        email: _emailController.text,
        firstName: _nameController.text.split(' ').first,
        lastName: _nameController.text.split(' ').last,
        phone: _phoneController.text,
      ),
      fulfillment: FulfillmentRequest(
        shippingMethod: widget.checkoutToken.shippingMethods?.first.id,
      ),
      payment: PaymentRequest(
        gateway: widget.checkoutToken.gateways?.first.code,
        card: CardRequest(
          number: _cardNumberController.text.replaceAll(' ', ''),
          expiryMonth: _expiryMonthController.text,
          expiryYear: _expiryYearController.text,
          cvc: _cvcController.text,
          postalZipCode: _zipController.text,
        ),
      ),
      lineItems: widget.checkoutToken.lineItems != null
          ? {
              for (var item in widget.checkoutToken.lineItems!)
                item.id ?? '': LineItemsRequest(
                  quantity: item.quantity,
                  variants: {
                    for (var option in item.selectedOptions ?? []) option.groupId: option.optionId,
                  },
                ),
            }
          : {},
    );

    context.read<CheckOutBloc>().add(CaptureOrder(orderRequest));
    context.read<CheckOutBloc>().add(ResetCheckOut());
  }
}
