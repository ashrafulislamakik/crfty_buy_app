import 'package:crfty_buy/features/presentation/screen/Sign_In.dart';
import 'package:crfty_buy/features/presentation/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/Shared/Presentation/Main_Nav_Holders_Screen.dart';
import '../features/presentation/screen/Sign_Up.dart';
import '../features/presentation/screen/Verify_Otp.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();
    switch (settings.name) {
      case '/':
        widget = const splash_screen();
        break;
      case SignUp.name:
        widget = const SignUp();
        break;
      case SignIn.name:
        widget = const SignIn();
        break;
      case Verify_Otp.name:
        widget = const Verify_Otp();
        break;
      case MainNavHoldersScreen.name:
        widget = const MainNavHoldersScreen();
        break;

    }
    return MaterialPageRoute(builder: (_) => widget);
  }
}
