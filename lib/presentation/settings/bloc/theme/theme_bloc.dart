import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../managers/enum/enum.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ThemeBloc({required this.firestore, required this.auth}) : super(const ThemeState()) {
    on<LoadTheme>(_onLoadTheme);
    on<ThemeChanged>(_onThemeChanged);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        final doc = await firestore.collection('buyers').doc(user.uid).get();
        final isDarkMode = doc.data()?['isDarkMode'] ?? false;
        emit(state.copyWith(isDarkMode: isDarkMode));
      }
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        await firestore.collection('buyers').doc(user.uid).set({
          'isDarkMode': event.isDarkMode,
        }, SetOptions(merge: true));
        emit(state.copyWith(isDarkMode: event.isDarkMode));
      }
    } catch (e) {
      emit(state.copyWith(status: Status.failure, errorMessage: e.toString()));
    }
  }
}
