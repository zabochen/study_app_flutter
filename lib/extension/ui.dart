import 'package:flutter/material.dart';

// Guide:
// https://material.io/develop/flutter/components/snackbars
extension Snackbar on BuildContext {
  void showSnackbar(String message) {
    // Find the Scaffold in the widget tree and use it to show a SnackBar
    Scaffold.of(this).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: Duration(seconds: 5),
    ));
  }
}
