import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/enum/enum.dart';

part 'shipping_event.dart';
part 'shipping_state.dart';

class ShippingBloc extends Bloc<ShippingEvent, ShippingState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  ShippingBloc(this._auth, this._firestore) : super(const ShippingState()) {
    on<FetchShippingInfoEvent>(_onFetchShippingInfo);
    on<UpdateShippingInfoEvent>(_onUpdateShippingInfo);
  }

  Future<void> _onFetchShippingInfo(FetchShippingInfoEvent event, Emitter<ShippingState> emit) async {
    emit(state.copyWith(userStatus: Status.loading));
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          final data = userDoc.data() as Map<String, dynamic>;
          emit(state.copyWith(
            name: data['name'],
            email: data['email'],
            street: data['street'],
            city: data['city'],
            state: data['state'],
            zip: data['zip'],
            country: data['country'],
            phone: data['phone'],
            status: Status.success,
          ));
        } else {
          emit(state.copyWith(userStatus: Status.success));
        }
      }
    } catch (error) {
      emit(state.copyWith(userStatus: Status.failure, errorMessage: error.toString()));
    }
  }

  Future<void> _onUpdateShippingInfo(UpdateShippingInfoEvent event, Emitter<ShippingState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'name': event.name,
          'email': event.email,
          'street': event.street,
          'city': event.city,
          'state': event.state,
          'zip': event.zip,
          'country': event.country,
          'phone': event.phone,
        });
        emit(state.copyWith(
          name: event.name,
          street: event.street,
          city: event.city,
          state: event.state,
          zip: event.zip,
          country: event.country,
          phone: event.phone,
          email: event.email,
          status: Status.success,
        ));
      }
    } catch (error) {
      emit(state.copyWith(status: Status.failure, errorMessage: error.toString()));
    }
  }
}
