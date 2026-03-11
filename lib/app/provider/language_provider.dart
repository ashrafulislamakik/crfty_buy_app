import 'package:flutter/cupertino.dart';

class Languageprovider extends ChangeNotifier {
  Locale _currentlocale = Locale("en");

  Locale get currentlocale => _currentlocale;

  List<Locale> _supportedlocale = [Locale("en"), Locale("bn")];

  List<Locale> get supportedlocales => _supportedlocale;

  void changeLocale(Locale locale) {
    _currentlocale = locale;
    notifyListeners();
  }
}
