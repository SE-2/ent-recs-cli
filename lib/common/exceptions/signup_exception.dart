class SignupException implements Exception {
  final String message;

  SignupException(this.message);

  @override
  String toString() => message;
}
