import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ride/main.dart';

class ErroHandler {
  static void firebaseErrorHandler(FirebaseException exception) {
    if (exception.code == 'weak-password') {
      showErrorMessage("Weak password");
    } else if (exception.code == 'email-already-in-use') {
      showErrorMessage("Email is already used");
    }
  }

  static void showErrorMessage(String message) {
    BuildContext? context = MyApp.navigatorKey.currentContext;
    if (context == null) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black87,
        content: Text(
          message,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        )));
  }
}
