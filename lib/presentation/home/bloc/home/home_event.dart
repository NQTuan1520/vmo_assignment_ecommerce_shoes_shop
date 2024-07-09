part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class UpdateScrollPosition extends HomeEvent {
  final bool isScrolled;

  const UpdateScrollPosition(this.isScrolled);

  @override
  List<Object?> get props => [isScrolled];
}

class GetProfileUser extends HomeEvent {}

class LogoutUser extends HomeEvent {}
