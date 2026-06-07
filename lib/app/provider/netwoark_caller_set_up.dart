import 'package:crfty_buy/Core/Servises/Netwoark_Caller.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/screen/Sign_In.dart';
import '../crafty_buy.dart';

NetworkCaller getNetworkCaller () {
  return NetworkCaller( headers: {
    "content-type" : "application/json"
  },

  onUnauthorize: () {
    _moveToSigninScreen();
  });
}

void _moveToSigninScreen() {
  Navigator.pushNamed(craftybuyapp.navigatorKey.currentContext!, SignIn.name);
}