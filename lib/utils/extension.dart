import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void pushScreen(Widget route) => Navigator.of(this).push(MaterialPageRoute(
        builder: (context) => route,
      ));

  void popReplacement(Widget route) =>
      Navigator.of(this).pushReplacement(MaterialPageRoute(
        builder: (context) => route,
      ));

  void popScreen() => Navigator.of(this).pop();

  Future<void> checkInternetConnection() async {
    var connectionResult = await Connectivity().checkConnectivity();

    if (connectionResult != ConnectivityResult.mobile &&
        connectionResult != ConnectivityResult.wifi) {
      displaySnackBar(
          "No Network connection !.Please check your network connection");
    }
  }

  void displaySnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}

extension NumExtension on num {
  SizedBox get spacingHeight => SizedBox(
        height: toDouble(),
      );

  SizedBox get spacingWidth => SizedBox(
        width: toDouble(),
      );
}
