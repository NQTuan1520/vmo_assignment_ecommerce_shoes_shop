abstract class AuthRepository {
  Future<String> createUser(String fullName, String telephone, String email, String password);
  Future<String> loginUser(String email, String password);
  Future<String> forgotPassword(String email);
  Future<String> signInWithGoogle();
  Future<void> signOut();
  Future<void> saveUserLoggedInState();
  Future<void> clearUserLoggedInState();
  Future<bool> isUserLoggedIn();
  Future<void> saveCredentials(String email, String password);
  Future<Map<String, String?>> getSavedCredentials();
  Future<void> clearSavedCredentials();
}
