abstract interface class AuthDatasource {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> signUpWithEmailAndPassword(String username, String email, String password);
}