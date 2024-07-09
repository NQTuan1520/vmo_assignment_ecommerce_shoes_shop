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
}
