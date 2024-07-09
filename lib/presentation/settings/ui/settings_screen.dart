import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restart_app/restart_app.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/colors/colors.dart';

import '../../home/bloc/home/home_bloc.dart';
import '../bloc/language/language_bloc.dart';
import '../bloc/theme/theme_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkModeEnabled = false;
  String selectedLanguage = 'English';
  final MyColorTheme colorTheme = MyColorTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account_and_Settings".tr(),
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: colorTheme.blueBottomBar,
        elevation: 4.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Text(
                  "Account".tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                ListTile(
                  leading: Icon(Icons.person, size: 24.sp),
                  title: Text("Profile_Settings".tr(), style: TextStyle(fontSize: 16.sp)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18.sp),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                Divider(thickness: 1.5.h),
                ListTile(
                  leading: Icon(Icons.local_shipping, size: 24.sp),
                  title: Text("Shipping_Info".tr(), style: TextStyle(fontSize: 16.sp)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18.sp),
                  onTap: () {
                    Navigator.pushNamed(context, '/shipping_info');
                  },
                ),
                SizedBox(height: 18.h),
                Text(
                  "App_Settings".tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return SwitchListTile(
                      title: Text("Dark_Mode".tr(), style: TextStyle(fontSize: 16.sp)),
                      value: state.isDarkMode,
                      onChanged: (bool value) {
                        context.read<ThemeBloc>().add(ThemeChanged(isDarkMode: value));
                      },
                    );
                  },
                ),
                BlocBuilder<LanguageBloc, LanguageState>(
                  builder: (context, state) {
                    final supportedLocales = context.supportedLocales;

                    final items = supportedLocales.map((Locale locale) {
                      return DropdownMenuItem<Locale>(
                        value: locale,
                        child: Text(
                          locale.languageCode == 'en' ? 'English' : 'Vietnamese',
                          style: TextStyle(fontSize: 16.sp),
                        ), // Display language name
                      );
                    }).toList();

                    final currentValue = items
                        .firstWhere(
                          (item) => item.value == state.locale,
                          orElse: () => items.first,
                        )
                        .value;

                    return ListTile(
                      title: Text("Change_Language".tr(), style: TextStyle(fontSize: 16.sp)),
                      trailing: DropdownButton<Locale>(
                        value: currentValue,
                        onChanged: (Locale? newValue) {
                          if (newValue != null && supportedLocales.contains(newValue)) {
                            _showLanguageChangeDialog(newValue);
                          }
                        },
                        items: items,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ElevatedButton(
              onPressed: () {
                _showSignOutDialog(context);
              },
              child: Text("Sign_Out".tr(), style: TextStyle(fontSize: 18.sp)),
            ),
          ),
        ],
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sign_Out".tr()),
          content: Text("Sign_Out_Confirmation".tr()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text("Cancel".tr()),
            ),
            TextButton(
              onPressed: () async {
                context.read<HomeBloc>().add(LogoutUser());
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pushReplacementNamed(context, '/log_in');
              },
              child: Text("Sign_Out".tr()),
            ),
          ],
        );
      },
    );
  }

  void _showLanguageChangeDialog(Locale newValue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "language_change_title".tr(),
            style: TextStyle(fontSize: 20.sp),
          ),
          content: Text(
            "language_change_content".tr(),
            style: TextStyle(fontSize: 16.sp),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text("Cancel".tr()),
            ),
            TextButton(
              onPressed: () {
                context.read<LanguageBloc>().add(ChangeLanguage(newValue));
                context.setLocale(newValue); // Update locale using EasyLocalization
                Restart.restartApp(); // Restart the app to apply changes
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text("Yes".tr()),
            ),
          ],
        );
      },
    );
  }
}
