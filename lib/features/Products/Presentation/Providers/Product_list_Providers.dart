import 'package:flutter/cupertino.dart';

import '../../../../Core/Servises/Netwoark_Caller.dart';
import '../../../../app/Urls.dart';
import '../../../../app/provider/netwoark_caller_set_up.dart';
import '../../../Categories/Models/categories_models.dart';
import '../../data/models/productmodel.dart';


class ProductListProviders extends ChangeNotifier {

  final int _pageSize = 30;
  int _currentPageNo = 0;
  int? _lastPage;
  bool _getInitialProductListProgress = true;
  bool _loadMoreProductListProgress = false;
  final List<ProductModel> _products = [];
  bool get getInitialProductListProgress => _getInitialProductListProgress;
  bool get loadMoreProductListProgress => _loadMoreProductListProgress;
  List<ProductModel> get product => _products;

  String? _errorMesege;
  String? get errorMesege => _errorMesege;

  Future<bool> getProduct(String categoryId) async {
    bool isSucces = false;

    if (_lastPage != null && _currentPageNo >= _lastPage!){
      return false;
    }
    _currentPageNo++;


    if(_isInitialLoading){
      _getInitialProductListProgress = true;

    } else {
      _loadMoreProductListProgress = true;
    }
    notifyListeners();
    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.productListUrl(_currentPageNo, _pageSize,categoryId as String),);
    if (response.isSuccess) {
      _lastPage = response.body["data"]["last_page"] ?? _lastPage;
      List<ProductModel> productlist = [];
      for (Map<String, dynamic> product in response.body["data"]["results"]) {
        productlist.add(ProductModel.fromJson(product));
      }

      _products.addAll(productlist);
      isSucces = true;
      _errorMesege = null;
    } else {
      _errorMesege = response.errorMessage;
    }

    if(_isInitialLoading){
      _getInitialProductListProgress = false;
    } else {
      _loadMoreProductListProgress = false;
    }
    notifyListeners();
    return isSucces;

  }

  bool get _isInitialLoading {
    return _currentPageNo == 1;
  }

  bool get isLoading => _getInitialProductListProgress || _loadMoreProductListProgress;



}

