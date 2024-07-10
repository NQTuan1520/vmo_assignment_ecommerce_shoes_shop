// presentation/utils/ui_helpers.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginUIHelpers {
  static Future<void> showLoginPrompt(BuildContext context, String targetRoute) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("login_required".tr()),
          content: Text("login_required_description".tr()),
          actions: <Widget>[
            TextButton(
              child: Text("cancel".tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("login".tr()),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(
                  context,
                  '/log_in',
                  arguments: targetRoute,
                );
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> checkLoginStatusAndPrompt(BuildContext context, String targetRoute, dynamic arguments) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isGuest = prefs.getBool('isGuest') ?? true;

    if (!context.mounted) return;

    if (isGuest) {
      showLoginPrompt(context, targetRoute);
    } else {
      Navigator.pushNamed(context, targetRoute, arguments: arguments);
    }
  }
}
