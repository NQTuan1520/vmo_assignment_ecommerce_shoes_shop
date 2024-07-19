import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final SharedPreferences prefs;

  LanguageBloc({required this.prefs}) : super(const LanguageState(Locale('en', 'US'))) {
    on<LoadLanguage>(_onLoadLanguage);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  Future<void> _onLoadLanguage(LoadLanguage event, Emitter<LanguageState> emit) async {
    final langCode = prefs.getString('language_code') ?? 'en';
    final countryCode = prefs.getString('country_code') ?? 'US';
    final locale = Locale(langCode, countryCode);
    emit(LanguageState(locale));
  }

  Future<void> _onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    await prefs.setString('language_code', event.locale.languageCode);
    await prefs.setString('country_code', event.locale.countryCode ?? 'US');
    emit(LanguageState(event.locale));
  }
}
