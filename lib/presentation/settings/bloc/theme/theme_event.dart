part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class LoadTheme extends ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final bool isDarkMode;

  const ThemeChanged({required this.isDarkMode});

  @override
  List<Object?> get props => [isDarkMode];
}
