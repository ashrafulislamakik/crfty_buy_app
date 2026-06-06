import 'package:flutter/cupertino.dart';

import '../../../../Core/Servises/Netwoark_Caller.dart';
import '../../../../app/Urls.dart';
import '../../../../app/provider/netwoark_caller_set_up.dart';
import '../../data/models/slider_model.dart';

class HomeSliderProviders extends ChangeNotifier {
  bool _getHomeSliderProgress = false;
  List<SliderModel> _sliderModels = [];

  bool get getHomeSliderProgress => _getHomeSliderProgress;

  List<SliderModel> get homeSliderModels => _sliderModels;

  String? _errorMesege;

  String? get errorMesege => _errorMesege;

  Future<bool> getHomeSlider() async {
    bool isSucces = false;
    _getHomeSliderProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.homeSliderUrl,
    );

    if (response.isSuccess) {
      List<SliderModel> sliders = [];
      for (Map<String, dynamic> slider in response.body["data"]["results"]) {
        sliders.add(SliderModel.fromJson(slider));
      }
      _sliderModels = sliders;
      _errorMesege = null;
      isSucces = true;
    } else {
      _errorMesege = response.errorMessage;
    }
    _getHomeSliderProgress = false;
    notifyListeners();

    return isSucces;
  }
}
