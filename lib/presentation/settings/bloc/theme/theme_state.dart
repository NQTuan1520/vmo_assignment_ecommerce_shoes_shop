part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final Status status;
  final bool isDarkMode;
  final String? errorMessage;

  const ThemeState({
    this.status = Status.initial,
    this.isDarkMode = false,
    this.errorMessage,
  });

  ThemeState copyWith({
    Status? status,
    bool? isDarkMode,
    String? errorMessage,
  }) {
    return ThemeState(
      status: status ?? this.status,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, isDarkMode, errorMessage];
}
