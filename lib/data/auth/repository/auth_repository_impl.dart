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
  final SharedPreferences _prefs;

  AuthRepositoryImpl(this._auth, this._fireStore, this._prefs);

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
      await _prefs.setBool('isGuest', false);
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
      await _prefs.setBool('isGuest', false);
      return 'success';
    } catch (e) {
      return handleError(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _prefs.setBool('isGuest', true);
      ToastUtils.showSuccessToast(message: tr("Successfully_signed_out"));
    } catch (e) {
      ToastUtils.showErrorToast(message: '${tr("Sign_out_failed")}: $e');
    }
  }

  @override
  Future<void> saveUserLoggedInState() async {
    await _prefs.setBool('isLoggedIn', true);
  }

  @override
  Future<void> clearUserLoggedInState() async {
    await _prefs.remove('isLoggedIn');
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return _prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Future<void> saveCredentials(String email, String password) async {
    await _prefs.setString('saved_email', email);
    await _prefs.setString('saved_password', password);
  }

  @override
  Future<Map<String, String?>> getSavedCredentials() async {
    return {
      'email': _prefs.getString('saved_email'),
      'password': _prefs.getString('saved_password'),
    };
  }

  @override
  Future<void> clearSavedCredentials() async {
    await _prefs.remove('saved_email');
    await _prefs.remove('saved_password');
  }

  String handleError(e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'email-already-in-use':
          return tr("email_already_in_use");
        case 'invalid-email':
          return tr("invalid_email");
        case 'user-not-found':
          return tr("user_not_found");
        case 'wrong-password':
          return tr("wrong_password");
        default:
          return tr("${"error_occurred"} ${e.message}");
      }
    } else {
      return "${tr("error_occurred")} $e";
    }
  }
}
