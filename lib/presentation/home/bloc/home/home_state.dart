part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status status;
  final bool isScrolled;
  final String? errorMessage;
  final String? name;

  const HomeState({
    this.status = Status.initial,
    this.isScrolled = false,
    this.errorMessage,
    this.name,
  });

  HomeState copyWith({Status? status, bool? isScrolled, String? errorMessage, String? name}) {
    return HomeState(
      status: status ?? this.status,
      isScrolled: isScrolled ?? this.isScrolled,
      errorMessage: errorMessage ?? this.errorMessage,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [
        status,
        isScrolled,
        errorMessage,
        name,
      ];
}
