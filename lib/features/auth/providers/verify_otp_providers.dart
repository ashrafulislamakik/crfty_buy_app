import 'package:crfty_buy/app/Controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/Servises/Netwoark_Caller.dart';
import '../../../app/Urls.dart';
import '../../../app/provider/netwoark_caller_set_up.dart';
import '../../presentation/screen/Sign_Up.dart' as urls;
import '../data/models/SignUp_params.dart';
import '../models/user_model.dart';

class  VerifyOtpProviders extends ChangeNotifier{
  bool _VerifyOtpProgress = false;

  bool get VerifyOtpProgress => _VerifyOtpProgress;

  String? _errorMesege;
  String? get errorMesege => _errorMesege;

  Future<bool> verifyOtp( {required String email,required String otp}) async {

    bool isSucces = false;
    _VerifyOtpProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.verifyotpurl,
      body: {
        "email": email,
        "otp": otp,
      }
    );

    if (response.isSuccess) {

      //usermodel save to storage
      UserModel userModel = UserModel.fromJson(response.body["data"]["user"]);
      String token = response.body["data"]["token"];

      await AuthController.saveUserData(token,userModel);

      _errorMesege = null;
      isSucces = true;
    } else {
      _errorMesege = response.errorMessage ;
    }
    _VerifyOtpProgress = false;
    notifyListeners();

    return isSucces;
  }

}

