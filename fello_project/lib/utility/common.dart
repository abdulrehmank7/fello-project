import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;

  double get getHeight => MediaQuery.of(this).size.height;
}
