import 'package:flutter/material.dart';

extension ColorScehemeExt on BuildContext{
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}