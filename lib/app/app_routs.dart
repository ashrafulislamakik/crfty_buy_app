import 'package:crfty_buy/features/presentation/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();
    switch (settings.name) {
      case '/':
        widget = const splash_screen();
        break;
    }
    return MaterialPageRoute(builder: (_) => widget);
  }
}
