part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final Status status;
  final int currentPage;

  const OnboardingState({
    this.status = Status.initial,
    this.currentPage = 0,
  });

  OnboardingState copyWith({
    Status? status,
    int? currentPage,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [status, currentPage];
}
