import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/auth/repository/auth_repository.dart';

import '../../../presentation/common/widgets/toast_utils.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _fireStore;

  AuthRepositoryImpl(this._auth, this._fireStore);

  @override
  Future<String> createUser(String fullName, String telephone, String email, String password) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _fireStore.collection('buyers').doc(cred.user!.uid).set({
        'fullName': fullName,
        'telephone': telephone,
        'email': email,
        'password': password,
        'buyerID': cred.user!.uid,
      });
      return 'success';
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<String> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isGuest', false);
      return 'success';
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<String> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 'success';
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) return 'cancelled';
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      UserCredential cred = await _auth.signInWithCredential(credential);
      final user = cred.user;
      final userDoc = await _fireStore.collection('buyers').doc(user?.uid).get();

      if (!userDoc.exists) {
        await _fireStore.collection('buyers').doc(cred.user!.uid).set({
          'fullName': user?.displayName ?? 'Anonymous',
          'telephone': '',
          'email': user?.email,
          'password': '',
        });
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isGuest', false);
      return 'success';
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isGuest', true);
      ToastUtils.showSuccessToast(message: "Successfully_signed_out".tr());
    } catch (e) {
      ToastUtils.showErrorToast(message: '${"Sign_out_failed".tr()}: $e');
    }
  }

  String handleError(e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'email-already-in-use':
          return "email_already_in_use".tr();
        case 'invalid-email':
          return "invalid_email".tr();
        case 'user-not-found':
          return "user_not_found".tr();
        case 'wrong-password':
          return "wrong_password".tr();
        default:
          return "${"error_occurred".tr()} ${e.message}";
      }
    } else {
      return "${"error_occurred".tr()} $e";
    }
  }
}
