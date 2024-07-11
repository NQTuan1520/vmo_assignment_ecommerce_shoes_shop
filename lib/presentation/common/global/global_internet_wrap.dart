import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../managers/enum/enum.dart';
import '../../connectivity/connectivity_bloc.dart';
import '../widgets/no_internet_dialog.dart';

class GlobalConnectivityWrapper extends StatelessWidget {
  final Widget child;

  const GlobalConnectivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        if (state.status == Status.failure) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => NoInternetDialog(
              onRetry: () {
                context.read<ConnectivityBloc>().add(CheckConnectivity());
              },
            ),
          );
        } else if (state.status == Status.success) {
          Navigator.of(context).pop();
        }
      },
      child: child,
    );
  }
}
