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
          ToastUtils.showSuccessToast(message: context.tr("sign_up_success"));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreenProvider()),
          );
        } else if (state.status == Status.failure) {
          ToastUtils.showErrorToast(message: "${context.tr("some_error_occurred")}: ${state.errorMessage}");
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
                              context.tr("create_account"),
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              context.tr("create_account_text"),
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
                            labelText: context.tr("email_address"),
                            hintText: context.tr("email_address_hint_text"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return context.tr("email_empty_error");
                              }
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextField(
                            controller: _nameController,
                            labelText: context.tr("name"),
                            hintText: context.tr("name_hint_text"),
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return context.tr("name_empty_error");
                              }
                            },
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextField(
                            controller: _telephoneController,
                            labelText: context.tr("telephone"),
                            hintText: context.tr("telephone_hint_text"),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              } else {
                                return context.tr("telephone_empty_error");
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
                                labelText: context.tr("password"),
                                hintText: context.tr("password_hint_text"),
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
                                    return context.tr("password_empty_error");
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
                            textButton: context.tr("sign_up"),
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
                            textButton: context.tr("sign_in_with_google"),
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
                              ToastUtils.showSuccessToast(message: context.tr("sign_in_success"));
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
                            context.tr("have_account"),
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
                              context.tr("sign_in"),
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
