import 'package:flutter/cupertino.dart';

import '../../../Core/Servises/Netwoark_Caller.dart';
import '../../../app/Urls.dart';
import '../../../app/provider/netwoark_caller_set_up.dart';
import '../Models/categories_models.dart';

class CategoriesListProviders extends ChangeNotifier {

  final int _pageSize = 30;
  int _currentPageNo = 0;
  int? _lastPage;
  bool _getInitialCategoriesListProgress = true;
  bool _loadMoreCategoriesListProgress = false;
  final List<Categoriesmodel> _categories = [];
  bool get getInitialCategoriesListProgress => _getInitialCategoriesListProgress;
  bool get loadMoreCategoriesListProgress => _loadMoreCategoriesListProgress;
  List<Categoriesmodel> get categories => _categories;

  String? _errorMesege;
  String? get errorMesege => _errorMesege;

  Future<bool> getCategories() async {
    bool isSucces = false;

    if (_lastPage != null && _currentPageNo >= _lastPage!){
      return false;
    }
    _currentPageNo++;


    if(_isInitialLoading){
      _getInitialCategoriesListProgress = true;

    } else {
      _loadMoreCategoriesListProgress = true;
    }
    notifyListeners();
    final NetworkResponse response = await getNetworkCaller().getRequest(
      Urls.CategoriesListUrl(_currentPageNo, _pageSize),);
    if (response.isSuccess) {
      _lastPage = response.body["data"]["last_page"] ?? _lastPage;
      List<Categoriesmodel> categorieslist = [];
      for (Map<String, dynamic> category in response.body["data"]["results"]) {
        categorieslist.add(Categoriesmodel.fromJson(category));
    }

      _categories.addAll(categorieslist);
      isSucces = true;
      _errorMesege = null;
    } else {
      _errorMesege = response.errorMessage;
    }

    if(_isInitialLoading){
      _getInitialCategoriesListProgress = false;
    } else {
      _loadMoreCategoriesListProgress = false;
    }
    notifyListeners();
    return isSucces;

    }

    bool get _isInitialLoading {
    return _currentPageNo == 1;
    }

    bool get isLoading => _getInitialCategoriesListProgress || _loadMoreCategoriesListProgress;



  }

