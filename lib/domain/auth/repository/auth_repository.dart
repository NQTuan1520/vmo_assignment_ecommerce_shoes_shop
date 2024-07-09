abstract class AuthRepository {
  Future<String> createUser(String fullName, String telephone, String email, String password);
  Future<String> loginUser(String email, String password);
  Future<String> forgotPassword(String email);
  Future<String> signInWithGoogle();
  Future<void> signOut();
}
