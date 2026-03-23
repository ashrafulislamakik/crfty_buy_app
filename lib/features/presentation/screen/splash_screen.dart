import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Shared/Presentation/Main_Nav_Holders_Screen.dart';
import '../widget/app_logo.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainNavHoldersScreen.name);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AppLogo(
                height: 120,
              ),
            ),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}


