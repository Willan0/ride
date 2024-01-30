import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ride/utils/error_handler.dart';

class FirebaseAuthentication {
  static Future<User?> signInWithEmail(String email, String password) async {
    try {
      return (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
      // credential.credential.accessToken
    } on FirebaseAuthException catch (e) {
      ErroHandler.firebaseErrorHandler(e);
    } catch (e) {
      debugPrint("SignIn error : $e");
    }
    return null;
  }

  // Future<bool?> isLogin()async{
  //   return FirebaseAuth.instance
  // }
}
