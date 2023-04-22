import '../../domain/repositories/auth_repository.dart';

/*
class GoogleSignInRepository implements AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<User?> getCurrentUser() async {
    final user = await _googleSignIn.signInSilently();
    return _toUser(user);
  }

  @override
  Future<User?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    return _toUser(googleUser);
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  User? _toUser(GoogleSignInAccount? googleUser) {
    if (googleUser != null) {
      return User(
        id: googleUser.id,
        name: googleUser.displayName,
        email: googleUser.email,
        photoUrl: googleUser.photoUrl,
      );
    } else {
      return null;
    }
  }
}
*/
