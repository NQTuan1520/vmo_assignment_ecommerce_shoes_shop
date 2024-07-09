import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../managers/enum/enum.dart';
import '../bloc /profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == Status.failure) {
            return Center(child: Text('${"Failed to load profile".tr()} ${state.errorMessage}'));
          } else if (state.status == Status.success) {
            _nameController.text = state.name ?? '';
            _emailController.text = state.email ?? '';
            _phoneController.text = state.phone ?? '';
          }
          return Column(
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
                              Icons.person,
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
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.person, color: Colors.purple),
                        labelText: "Name".tr(),
                        labelStyle: TextStyle(fontSize: 18.sp),
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
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.email, color: Colors.redAccent),
                        labelText: "Email".tr(),
                        labelStyle: TextStyle(fontSize: 18.sp),
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
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: const Icon(Icons.phone, color: Colors.green),
                        labelText: "Phone_Number".tr(),
                        labelStyle: TextStyle(fontSize: 18.sp),
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
                            context.read<ProfileBloc>().add(UpdateProfile(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                ));
                          },
                          child: Text(
                            "Update_Profile".tr(),
                            style: TextStyle(fontSize: 18.sp, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
