import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthModel {
  Future<UserCredential> signIn(
      {required String email, required String password});

  Future<UserCredential> signUp(
      {required String email, required String password});

  Future<void> forgotPassword({required String email});
}
