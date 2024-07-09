import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  ProfileBloc({required this.firebaseAuth, required this.firebaseFirestore}) : super(const ProfileState()) {
    on<UpdateProfile>(_onUpdateProfile);
    on<GetProfile>(_onGetProfile);
  }

  Future<void> _onGetProfile(GetProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      final DocumentSnapshot userDoc = await firebaseFirestore.collection('buyers').doc(user.uid).get();
      if (userDoc.exists) {
        emit(state.copyWith(
          status: Status.success,
          name: userDoc['fullName'],
          email: userDoc['email'],
          phone: userDoc['telephone'],
        ));
      }
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: 'User not found'));
    }
  }

  Future<void> _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      await firebaseFirestore.collection('buyers').doc(user.uid).update({
        'name': event.name,
        'email': event.email,
        'telephone': event.phone,
      });
      emit(state.copyWith(
        status: Status.success,
        name: event.name,
        email: event.email,
        phone: event.phone,
      ));
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: 'User not found'));
    }
  }
}
