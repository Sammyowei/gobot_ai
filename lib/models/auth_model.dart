import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthModel {
  Future<UserCredential> signIn(
      {required String email, required String password});

  Future<UserCredential> signUp(
      {required String email, required String password});

  Future<void> forgotPassword({required String email});

  Future confirmPasswordReset({required String code, required newPassword});

  User? getUserCredentials();

  Future changePassword({required String newPassword});
  String? getSessionId();
}
