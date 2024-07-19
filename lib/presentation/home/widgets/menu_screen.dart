import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/presentation/home/bloc/home/home_bloc.dart';

class MenuScreen extends StatelessWidget {
  final Function(int) onMenuItemClicked;
  final String? profileName;

  const MenuScreen({
    super.key,
    required this.onMenuItemClicked,
    required this.profileName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1A1A2E),
      padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            context.tr("Hey"),
            style: TextStyle(color: Colors.grey, fontSize: 20.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            profileName ?? context.tr("User"),
            style: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 32.h),
          _buildDrawerItem(icon: Icons.person, text: context.tr("Profile"), onTap: () => onMenuItemClicked(0)),
          _buildDrawerItem(icon: Icons.shopping_bag, text: context.tr("My_Cart"), onTap: () => onMenuItemClicked(1)),
          _buildDrawerItem(icon: Icons.favorite, text: context.tr("Favorite"), onTap: () => onMenuItemClicked(2)),
          _buildDrawerItem(icon: Icons.list, text: context.tr("Orders"), onTap: () => onMenuItemClicked(3)),
          _buildDrawerItem(icon: Icons.settings, text: context.tr("Settings"), onTap: () => onMenuItemClicked(4)),
          const Spacer(),
          Divider(color: Colors.grey.withOpacity(0.5)),
          _buildDrawerItem(
            icon: Icons.exit_to_app,
            text: context.tr("Sign_Out"),
            onTap: () {
              _showSignOutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: onTap,
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            context.tr("Sign_Out"),
            style: TextStyle(fontSize: 20.sp),
          ),
          content: Text(
            context.tr("Sign_Out_Confirmation"),
            style: TextStyle(fontSize: 16.sp),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.tr("Cancel")),
            ),
            TextButton(
              onPressed: () {
                context.read<HomeBloc>().add(LogoutUser());
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/log_in');
              },
              child: Text(context.tr("Sign_Out_Action")),
            ),
          ],
        );
      },
    );
  }
}
