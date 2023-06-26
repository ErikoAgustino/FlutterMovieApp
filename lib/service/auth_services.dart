import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> signUp(
      String fullName, String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        User user = result.user!;
        user.updateDisplayName(fullName);
        return user;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        return result.user;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<User?> updateFullName(String uid, String fullName) async {
    try {
      if (auth.currentUser != null) {
        if (uid == auth.currentUser!.uid) {
          User user = auth.currentUser!;
          user.updateDisplayName(fullName);
          return user;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Stream<User?> get firebaseUserStream => auth.authStateChanges();

  static Future<void> signOut() async {
    auth.signOut();
  }
}
