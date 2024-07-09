part of 'main_bloc.dart';

class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCurrentIndex extends MainEvent {
  final int index;

  const UpdateCurrentIndex(this.index);

  @override
  List<Object?> get props => [index];
}
