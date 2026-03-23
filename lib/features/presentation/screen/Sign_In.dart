import 'package:crfty_buy/app/app_colors.dart';
import 'package:crfty_buy/app/extensions/utils_extension.dart';
import 'package:crfty_buy/features/Shared/Presentation/Utils/Validators.dart';
import 'package:crfty_buy/features/presentation/widget/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const String name = "/Sign_In";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwoardTEController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 48),
                  AppLogo(),
                  const SizedBox(height: 8),
                  Text("Welcome Back", style: context.textTheme.titleLarge),
                  Text(
                    "Please Enter Your Email addrease",
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration:
                    InputDecoration(
                      hintText: "Email"
                    ),
                    validator: (String? value) =>
                    Validators.validateEmail(value, "Email is Required"),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    decoration:
                    InputDecoration(
                        hintText: "Passwoard"
                    ),
                    validator: (String? value) =>
                        Validators.validatePasswoard(value, ),
                  ),

                  const SizedBox(height: 16,),

                  FilledButton(
                      style: FilledButton.styleFrom(
                        fixedSize: Size.fromWidth(double.maxFinite),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: AppColors.themeColor
                      ),
                      onPressed: _onTapSignInButton, child: Text("Sign Up")
                  ),
                  const SizedBox(height: 16,),
                  TextButton(onPressed: _onTapSignUpButton,
                      child: Text("Need an account? Sign Up"))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton (){}
  void _onTapSignUpButton (){
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwoardTEController.dispose();

    super.dispose();
  }
}
