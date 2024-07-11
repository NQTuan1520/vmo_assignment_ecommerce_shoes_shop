import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/generated/assets.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/login/ui/login_screen_provider.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/custom_back_button.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/custom_button_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/custom_text_form_field_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/toast_utils.dart';

import '../../login/bloc/login_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = '/sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final MyColorTheme _colorTheme = MyColorTheme();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _telephoneController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          ToastUtils.showSuccessToast(message: "sign_up_success".tr());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreenProvider()),
          );
        } else if (state.status == Status.failure) {
          ToastUtils.showErrorToast(message: "${"some_error_occurred".tr()}: ${state.errorMessage}");
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CustomBackButton(),
              ),
            ),
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "create_account".tr(),
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "create_account_text".tr(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextField(
                            controller: _emailController,
                            labelText: "email_address".tr(),
                            hintText: "email_address_hint_text".tr(),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return "email_empty_error".tr();
                              }
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextField(
                            controller: _nameController,
                            labelText: "name".tr(),
                            hintText: "name_hint_text".tr(),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return "name_empty_error".tr();
                              }
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextField(
                            controller: _telephoneController,
                            labelText: "telephone".tr(),
                            hintText: "telephone_hint_text".tr(),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return "telephone_empty_error".tr();
                              }
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          BlocBuilder<SignUpBloc, SignUpState>(
                            builder: (context, state) {
                              return CustomTextField(
                                controller: _passwordController,
                                labelText: "password".tr(),
                                hintText: "password_hint_text".tr(),
                                isObscure: !state.showPassword,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    context.read<SignUpBloc>().add(TogglePasswordsVisibility());
                                  },
                                  icon: Icon(state.showPassword ? Icons.visibility : Icons.visibility_off),
                                ),
                                validator: (value) {
                                  if (value != null && value.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "password_empty_error".tr();
                                  }
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomButtonWidget(
                            height: 50.h,
                            width: double.infinity.w,
                            color: _colorTheme.blueButton,
                            textButton: "sign_up".tr(),
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            fontSize: 18.sp,
                            margin: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignUpBloc>().add(SignUpButtonPressed(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      name: _nameController.text,
                                      phone: _telephoneController.text,
                                    ));
                              }
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomButtonWidget(
                            height: 50.h,
                            width: double.infinity.w,
                            color: Colors.white,
                            isPrefixIcon: true,
                            prefixIcon: Assets.imagesGoogle,
                            sizeIcon: 22.sp,
                            textButton: "sign_in_with_google".tr(),
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            fontSize: 18.sp,
                            margin: EdgeInsets.symmetric(
                              vertical: 5.h,
                            ),
                            onTap: () {
                              context.read<LoginBloc>().add(LoginWithGoogle());
                              ToastUtils.showSuccessToast(message: "sign_in_success".tr());
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/main',
                                (route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "have_account".tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[500],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "sign_in".tr(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return Container(
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(),
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
}
