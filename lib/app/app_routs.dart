import 'package:crfty_buy/features/presentation/screen/Sign_In.dart';
import 'package:crfty_buy/features/presentation/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/Categories/Models/categories_models.dart';
import '../features/Products/Presentation/Screens/Product_details_Screen.dart';
import '../features/Products/Presentation/Screens/product_list_screen.dart';
import '../features/Shared/Presentation/Main_Nav_Holders_Screen.dart';
import '../features/Wishlist/Presentation/Screens/WishlistScreen.dart';
import '../features/presentation/screen/Sign_Up.dart';
import '../features/presentation/screen/Verify_Otp.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();
    switch (settings.name) {
      case '/':
        widget = const splash_screen();
        break;
      case SignUp.name:
        widget = const SignUp();
        break;
      case SignIn.name:
        widget = const SignIn();
        break;
      case Verify_Otp.name:
        final email = settings.arguments as String;
        widget = Verify_Otp(email: email,);
        break;
      case MainNavHoldersScreen.name:
        widget = const MainNavHoldersScreen();
        break;
      case ProductListScreen.name:
        final category = settings.arguments as Categoriesmodel;
        widget = ProductListScreen(category: category,);
        break;
      case WishListScreen.name:
        widget = const WishListScreen();
        break;

      case ProductDetailsScreen.name:
        widget =  ProductDetailsScreen();
        break;






    }
    return MaterialPageRoute(builder: (_) => widget);
  }
}
