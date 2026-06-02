import 'package:crfty_buy/app/Controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/Servises/Netwoark_Caller.dart';
import '../../../app/Urls.dart';
import '../../../app/provider/netwoark_caller_set_up.dart';
import '../../presentation/screen/Sign_In.dart';
import '../../presentation/screen/Sign_Up.dart' as urls;
import '../data/models/SignUp_params.dart';
import '../models/user_model.dart';

class  SignInProviders extends ChangeNotifier{
  bool _SignInProgress = false;

  bool get SignInProgress => _SignInProgress;

  String? _errorMesege;
  String? get errorMesege => _errorMesege;

  Future<bool> SignIn( {required String email,required String password}) async {

    bool isSucces = false;
    _SignInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.loginurl,
      body: {
        "email": email,
        "password": password,
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
    _SignInProgress = false;
    notifyListeners();

    return isSucces;
  }

}

