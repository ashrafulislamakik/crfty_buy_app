import 'package:crfty_buy/app/app_colors.dart';
import 'package:crfty_buy/app/extensions/utils_extension.dart';
import 'package:crfty_buy/features/Shared/Presentation/Utils/Validators.dart';
import 'package:crfty_buy/features/presentation/widget/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static const String name = "/Sign_Up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastnameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
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
                  AppLogo(),
                  const SizedBox(height: 8),
                  Text("Sign Up with Email", style: context.textTheme.titleLarge),
                  Text(
                    "Get Started with your detais",
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
                        hintText: "First Name "
                    ),
                    validator: (String? value) =>
                        Validators.validateText(value, "First Name is Required"),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    decoration:
                    InputDecoration(
                        hintText: "Last Name"
                    ),
                    validator: (String? value) =>
                        Validators.validateText(value, "Last Name is Required"),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    decoration:
                    InputDecoration(
                        hintText: "Phone"
                    ),
                    validator: (String? value) =>
                        Validators.validateText(value, "Last Name is Required"),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    decoration:
                    InputDecoration(
                        hintText: "City"
                    ),
                    validator: (String? value) =>
                        Validators.validateText(value, "City is Required"),
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
                      onPressed: _onTapSignUpButton, child: Text("Sign Up")
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton (){}

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwoardTEController.dispose();
    _lastnameTEController.dispose();
    _firstnameTEController.dispose();
    _phoneTEController.dispose();
    _cityTEController.dispose();

    super.dispose();
  }
}
