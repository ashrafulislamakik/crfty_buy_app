import 'package:crfty_buy/app/app_colors.dart';
import 'package:crfty_buy/app/extensions/utils_extension.dart';
import 'package:crfty_buy/features/Shared/Presentation/Utils/Validators.dart';
import 'package:crfty_buy/features/presentation/screen/Sign_In.dart';
import 'package:crfty_buy/features/presentation/widget/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../Shared/Presentation/Main_Nav_Holders_Screen.dart';
import '../../Shared/Presentation/Widgets/Center_Circuler_Progress_indecator.dart';
import '../../Shared/Presentation/Widgets/snack_bar_mesage.dart';
import '../../auth/providers/verify_otp_providers.dart';

class Verify_Otp extends StatefulWidget {
  const Verify_Otp({super.key, required this.email});

  static const String name = "/Verify_Otp";
  final String email;


  @override
  State<Verify_Otp> createState() => _Verify_OtpState();
}

class _Verify_OtpState extends State<Verify_Otp> {

  final TextEditingController _otpTEController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final VerifyOtpProviders _verifyootpProvider = VerifyOtpProviders();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _verifyootpProvider,
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
                    Text("Enter OTP Code", style: context.textTheme.titleLarge),
                    Text(
                      "A 4 digit OTP Code has been SEnt",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                   PinCodeTextField(
                     controller: _otpTEController,
                     length: 4,
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
                     validator: (String? value) {
                       if (value == null || value.length < 4) {
                         return "Enter your OTP";
                       }
                     }
                   ),

                    const SizedBox(height: 16,),

                    Consumer<VerifyOtpProviders>(
                        builder: (context,_,_) {

                          if (_verifyootpProvider.VerifyOtpProgress) {
                            return const CenterCirculerProgress();
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
                              onPressed: _onTapVerfyIButton , child: Text("Verify")
                          );
                        }

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
      ),
    );
  }

  void _onTapSignInButton (){
    Navigator.pushNamed(context, SignIn.name);
  }

  Future<void> _onTapVerfyIButton () async {
    if (_formkey.currentState!.validate()) {
      final bool isSucces = await _verifyootpProvider.verifyOtp(
          email: widget.email,
          otp: _otpTEController.text
      );
      if (isSucces) {
        Navigator.pushNamedAndRemoveUntil(
            context, MainNavHoldersScreen.name, (_) => false);
      } else {
        showSbakBarMessage(context, _verifyootpProvider.errorMesege!);


      }
    }
  }


  @override
  void dispose() {
    _otpTEController.dispose();

    super.dispose();
  }
}
