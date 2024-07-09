part of 'main_bloc.dart';

class MainState extends Equatable {
  final Status status;
  final int currentIndex;
  final String? errorMessage;

  const MainState({
    this.status = Status.initial,
    this.currentIndex = 1,
    this.errorMessage,
  });

  MainState copyWith({
    Status? status,
    int? currentIndex,
    String? errorMessage,
  }) {
    return MainState(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, currentIndex, errorMessage];
}
