abstract class BaseAuthRepository {
  Future<void> signUp(
      {required String email,
      required String password,
      required String fullName,
      required String phoneNumber});
  Future<void> singIn({required String email, required String password});
  Future<void> signOut();
  Future<void> signInWithGoogle();
  Future<Map<String, dynamic>> getUser(String email);
  // Stream<Map<String, dynamic>> getUser(String email);
  Future<void> updateName();
  Future<void> updatePhoneNumber();
}
