part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final Status status;
  final String? errorMessage;
  final String? name;
  final String? email;
  final String? phone;

  const ProfileState({
    this.status = Status.initial,
    this.errorMessage,
    this.name,
    this.email,
    this.phone,
  });

  ProfileState copyWith({
    Status? status,
    String? errorMessage,
    String? name,
    String? email,
    String? phone,
  }) {
    return ProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, name, email, phone];
}
