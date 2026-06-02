import 'package:flutter/cupertino.dart';

import '../../../Core/Servises/Netwoark_Caller.dart';
import '../../../app/Urls.dart';
import '../../../app/provider/netwoark_caller_set_up.dart';
import '../../presentation/screen/Sign_Up.dart' as urls;
import '../data/models/SignUp_params.dart';

class  SignUpProviders extends ChangeNotifier{
  bool _SignUpProgress = false;

  bool get SignUpProgress => _SignUpProgress;

  String? _errorMesege;
  String? get errorMesege => _errorMesege;

  Future<bool> SignUp(SignUpParams params) async {

    bool isSucces = false;
    _SignUpProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
      Urls.signup,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      _errorMesege = null;
      isSucces = true;
    } else {
      _errorMesege = response.errorMessage ;
    }
    _SignUpProgress = false;
    notifyListeners();

    return isSucces;
    }

  }

