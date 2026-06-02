import 'package:flutter/widgets.dart';

class MainNavProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateIndex (int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  void moveToCategories (){
    changeIndex(1);
  }

  void backToHpme (){
    changeIndex(0);
  }

  void changeIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }


  
}