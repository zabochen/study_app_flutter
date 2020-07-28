import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void navigateTo(String destination) {
    Navigator.of(this).pushNamed(destination);
  }
}
