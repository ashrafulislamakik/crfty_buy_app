import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension UtilsExtension on BuildContext {
  TextTheme get textTheme => TextTheme.of(this);
}