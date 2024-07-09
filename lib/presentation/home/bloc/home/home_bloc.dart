import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/auth/usecase/auth_usecase.dart';
import '../../../../managers/enum/enum.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final AuthUseCase authUseCase;

  HomeBloc({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.authUseCase,
  }) : super(const HomeState()) {
    on<UpdateScrollPosition>(_onUpdateScrollPosition);
    on<GetProfileUser>(_onGetProfileUser);
    on<LogoutUser>(_onLogoutUser);
  }

  void _onUpdateScrollPosition(UpdateScrollPosition event, Emitter emit) {
    emit(state.copyWith(isScrolled: event.isScrolled));
  }

  Future<void> _onGetProfileUser(GetProfileUser event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));
    final User? user = firebaseAuth.currentUser;
    if (user != null) {
      final DocumentSnapshot userDoc = await firebaseFirestore.collection('buyers').doc(user.uid).get();
      if (userDoc.exists) {
        emit(state.copyWith(
          status: Status.success,
          name: userDoc['fullName'],
        ));
      }
    } else {
      emit(state.copyWith(status: Status.failure, errorMessage: 'User not found'));
    }
  }

  Future<void> _onLogoutUser(LogoutUser event, Emitter emit) async {
    await authUseCase.signOut();
    emit(state.copyWith(status: Status.success));
  }
}
