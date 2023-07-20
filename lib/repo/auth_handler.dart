import 'package:gobot_ai/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHander implements AuthModel {
  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    try {
      final auth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return auth;
    } catch (signInError) {
      throw UnimplementedError();
    }
  }

  @override
  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    try {
      final auth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return auth;
    } catch (singUpError) {
      throw UnimplementedError();
    }
  }

  @override
  Future confirmPasswordReset({required String code, required newPassword}) {
    FirebaseAuth.instance
        .confirmPasswordReset(code: code, newPassword: newPassword);
    throw UnimplementedError();
  }

  @override
  User? getUserCredentials() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      return user;
    } catch (userCredentialsError) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> changePassword({required String newPassword}) async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
    } catch (changePasswordError) {
      throw UnimplementedError();
    }
  }

  @override
  String? getSessionId() {
    try {
      final sessionID = FirebaseAuth.instance.tenantId;
      return sessionID;
    } catch (getSessionIdError) {
      throw UnimplementedError();
    }
  }
}
