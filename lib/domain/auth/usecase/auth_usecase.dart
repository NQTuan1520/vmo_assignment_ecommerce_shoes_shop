import 'package:vmo_assignment_ecommerce_shoes_shop/domain/auth/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<String> createUser(String fullName, String telephone, String email, String password) {
    return repository.createUser(fullName, telephone, email, password);
  }

  Future<String> loginUser(String email, String password) {
    return repository.loginUser(email, password);
  }

  Future<String> forgotPassword(String email) {
    return repository.forgotPassword(email);
  }

  Future<String> signInWithGoogle() {
    return repository.signInWithGoogle();
  }

  Future<void> signOut() {
    return repository.signOut();
  }

  Future<void> saveUserLoggedInState() {
    return repository.saveUserLoggedInState();
  }

  Future<void> clearUserLoggedInState() {
    return repository.clearUserLoggedInState();
  }

  Future<bool> isUserLoggedIn() {
    return repository.isUserLoggedIn();
  }

  Future<void> saveCredentials(String email, String password) {
    return repository.saveCredentials(email, password);
  }

  Future<Map<String, String?>> getSavedCredentials() {
    return repository.getSavedCredentials();
  }

  Future<void> clearSavedCredentials() {
    return repository.clearSavedCredentials();
  }
}
