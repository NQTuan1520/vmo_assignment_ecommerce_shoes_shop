part of 'onboarding_bloc.dart';

class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCurrentPage extends OnboardingEvent {
  final int page;

  const UpdateCurrentPage(this.page);

  @override
  List<Object?> get props => [page];
}
