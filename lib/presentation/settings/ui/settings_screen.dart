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
  final MyColorTheme colorTheme = MyColorTheme();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.tr("Account_and_Settings"),
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: state.isDarkMode ? colorTheme.blueBottomBarDark : colorTheme.blueBottomBar,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16.w),
                  children: [
                    Text(
                      context.tr("Account"),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ListTile(
                      leading: Icon(Icons.person, size: 24.sp),
                      title: Text(context.tr("Profile_Settings"), style: TextStyle(fontSize: 16.sp)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 18.sp),
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                    ),
                    Divider(thickness: 1.5.h),
                    ListTile(
                      leading: Icon(Icons.local_shipping, size: 24.sp),
                      title: Text(context.tr("Shipping_Info"), style: TextStyle(fontSize: 16.sp)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 18.sp),
                      onTap: () {
                        Navigator.pushNamed(context, '/shipping_info');
                      },
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      context.tr("App_Settings"),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        return SwitchListTile(
                          title: Text(context.tr("Dark_Mode"), style: TextStyle(fontSize: 16.sp)),
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
                              locale.languageCode == 'en' ? context.tr("English") : context.tr("Vietnamese"),
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
                          title: Text(context.tr("Change_Language"), style: TextStyle(fontSize: 16.sp)),
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
                  child: Text(context.tr("Sign_Out"), style: TextStyle(fontSize: 18.sp)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.tr("Sign_Out")),
          content: Text(context.tr("Sign_Out_Confirmation")),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(context.tr("Cancel")),
            ),
            TextButton(
              onPressed: () async {
                context.read<HomeBloc>().add(LogoutUser());
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.pushReplacementNamed(context, '/log_in');
              },
              child: Text(context.tr("Sign_Out")),
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
            context.tr("language_change_title"),
            style: TextStyle(fontSize: 20.sp),
          ),
          content: Text(
            context.tr("language_change_content"),
            style: TextStyle(fontSize: 16.sp),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(context.tr("Cancel")),
            ),
            TextButton(
              onPressed: () {
                context.read<LanguageBloc>().add(ChangeLanguage(newValue));
                context.setLocale(newValue); // Update locale using EasyLocalization
                // Restart.restartApp(); // Restart the app to apply changes
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(context.tr("Yes")),
            ),
          ],
        );
      },
    );
  }
}
