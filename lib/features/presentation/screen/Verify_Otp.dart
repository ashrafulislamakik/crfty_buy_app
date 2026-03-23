import 'package:crfty_buy/app/app_colors.dart';
import 'package:crfty_buy/app/extensions/utils_extension.dart';
import 'package:crfty_buy/features/Shared/Presentation/Utils/Validators.dart';
import 'package:crfty_buy/features/presentation/screen/Sign_In.dart';
import 'package:crfty_buy/features/presentation/widget/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verify_Otp extends StatefulWidget {
  const Verify_Otp({super.key});

  static const String name = "/Verify_Otp";

  @override
  State<Verify_Otp> createState() => _Verify_OtpState();
}

class _Verify_OtpState extends State<Verify_Otp> {

  final TextEditingController _otpTEController = TextEditingController();

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
                  Text("Enter OTP Code", style: context.textTheme.titleLarge),
                  Text(
                    "A 4 digit OTP Code has been SEnt",
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                 PinCodeTextField(
                   controller: _otpTEController,
                   length: 6,
                   obscureText: false,
                   animationType: AnimationType.fade,
                   animationDuration: Duration(microseconds: 300),
                   appContext: context,
                   pinTheme: PinTheme(
                     shape: PinCodeFieldShape.box,
                     borderRadius: BorderRadius.circular(8),
                     fieldHeight: 50,
                     fieldWidth: 50
                   ),
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
                      onPressed: _onTapSignInButton, child: Text("Verify")
                  ),

                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("This Code Will expire in 12s"),
                      TextButton(onPressed: _onTapSignInButton,
                          child: Text("Resend")),
                    ],
                  ),
                  TextButton(onPressed: _onTapSignInButton,
                      child: Text(" Already have an account? Sign In"))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerfyIButton (){}
  void _onTapSignInButton (){
    Navigator.pushNamed(context, SignIn.name);
  }

  @override
  void dispose() {
    _otpTEController.dispose();

    super.dispose();
  }
}
