part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String name;
  final String email;
  final String phone;

  const UpdateProfile({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  List<Object> get props => [name, email, phone];
}
