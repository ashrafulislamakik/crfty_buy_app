import 'package:crfty_buy/app/app_colors.dart';
import 'package:crfty_buy/app/extensions/utils_extension.dart';
import 'package:crfty_buy/features/Shared/Presentation/Utils/Validators.dart';
import 'package:crfty_buy/features/presentation/widget/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Shared/Presentation/Main_Nav_Holders_Screen.dart';
import '../../Shared/Presentation/Widgets/snack_bar_mesage.dart';
import '../../auth/providers/Signin_provider.dart';
import 'Sign_In.dart';

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
  final SignInProviders _signinProvider = SignInProviders();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signinProvider,
      child: Scaffold(
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
                      controller: _emailTEController,
                      decoration:
                      InputDecoration(
                        hintText: "Email"
                      ),
                      validator: (String? value) =>
                      Validators.validateEmail(value, "Email is Required"),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _passwoardTEController,
                      decoration:
                      InputDecoration(
                          hintText: "Passwoard"
                      ),
                      validator: (String? value) =>
                          Validators.validatePasswoard(value, ),
                    ),

                    const SizedBox(height: 16,),

                    Consumer<SignInProviders>(
                        builder: (context,_,_) {


                          if (_signinProvider.SignInProgress) {
                            return const CircularProgressIndicator();
                          }
                          return FilledButton(
                              style: FilledButton.styleFrom(
                                fixedSize: Size.fromWidth(double.maxFinite),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12),
                                backgroundColor: AppColors.themeColor
                              ),
                              onPressed: _onTapSignInButton, child: Text("Sign In")
                          );
                        }

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
      ),
    );
  }

  void _onTapSignInButton (){}
  Future <void> _onTapSignUpButton () async {
    if (!_formkey.currentState!.validate()) {
      final bool isSucces = await _signinProvider.SignIn(
          email: _emailTEController.text.trim(),
          password: _passwoardTEController.text
      );
      if (isSucces) {
        Navigator.pushNamedAndRemoveUntil(
            context, MainNavHoldersScreen.name, (_) => false);
      } else {
        showSbakBarMessage(
            context, _signinProvider.errorMesege!);
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwoardTEController.dispose();

    super.dispose();
  }
  }
}
