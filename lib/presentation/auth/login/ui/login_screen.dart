import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/generated/assets.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/auth/login/bloc/login_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/custom_button_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/custom_text_form_field_widget.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/common/widgets/toast_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/log_in';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MyColorTheme _colorTheme = MyColorTheme();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeTextControllers();
  }

  void _initializeTextControllers() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('saved_email') ?? '';
    final savedPassword = prefs.getString('saved_password') ?? '';

    _emailController.text = savedEmail;
    _passwordController.text = savedPassword;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status == Status.success) {
          ToastUtils.showSuccessToast(message: "sign_in_success".tr());
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/main',
            (route) => false,
          );
        } else if (state.status == Status.failure) {
          ToastUtils.showErrorToast(message: "${"some_error_occurred".tr()}: ${state.errorMessage}");
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "hello".tr(),
                                  style: TextStyle(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Center(
                                child: Text(
                                  "welcome".tr(),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.h),
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
                              SizedBox(height: 10.h),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return CustomTextField(
                                    controller: _passwordController,
                                    labelText: "password".tr(),
                                    hintText: "password_hint_text".tr(),
                                    isObscure: !state.showPassword,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        context.read<LoginBloc>().add(TogglePasswordVisibility());
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
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: state.isRememberMe,
                                            onChanged: (value) {
                                              context.read<LoginBloc>().add(ToggleRememberMe());
                                            },
                                          ),
                                          Text("Remember_me".tr()),
                                        ],
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/forgot_password');
                                          },
                                          child: Text(
                                            "recovery_password".tr(),
                                          )),
                                    ],
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
                                textButton: "sign_in".tr(),
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
                                    context.read<LoginBloc>().add(LoginButtonPressed(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          rememberMe: context.read<LoginBloc>().state.isRememberMe,
                                        ));
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10.h,
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
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomButtonWidget(
                                height: 50.h,
                                width: double.infinity.w,
                                color: Colors.redAccent[100],
                                sizeIcon: 22.sp,
                                textButton: "sign_in_with_guest".tr(),
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                fontSize: 18.sp,
                                margin: EdgeInsets.symmetric(
                                  vertical: 5.h,
                                ),
                                onTap: () {
                                  context.read<LoginBloc>().add(GuestLogin());
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 30.h),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "no_account".tr(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sign_up');
                                  },
                                  child: Text(
                                    "sign_up_login".tr(),
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
              ),
              BlocBuilder<LoginBloc, LoginState>(
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
          );
        },
      ),
    );
  }
}
