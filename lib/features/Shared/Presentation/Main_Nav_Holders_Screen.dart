import 'package:crfty_buy/features/Cart/Presentations/screens/cart_screens.dart';
import 'package:crfty_buy/features/Shared/Presentation/providers/main_nav_provider.dart';
import 'package:crfty_buy/features/home/Presentation/providers/home_slider_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Categories/Providers/Categories_list_Providers.dart';
import '../../Categories/presentation/Screens/CategoriesScreens.dart';
import '../../Wishlist/Presentation/Screens/WishlistScreen.dart';
import '../../home/Presentation/Screens/home_screen.dart';

class MainNavHoldersScreen extends StatefulWidget {
  const MainNavHoldersScreen({super.key});

  static const String name = "/main-nav-holder";

  @override
  State<MainNavHoldersScreen> createState() => _MainNavHoldersScreenState();
}

class _MainNavHoldersScreenState extends State<MainNavHoldersScreen> {

  final List <Widget> _screens = [

    homescreen(),
    CategoriesListScreen(),
    CartSceens(),
    WishListScreen()


  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeSliderProviders>().getHomeSlider();
      context.read<CategoriesListProviders>().getCategories();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(
      builder: (context,mainNavProviders,_) {
        return Scaffold(
          body: _screens[mainNavProviders.selectedIndex],
            bottomNavigationBar: NavigationBar(
                onDestinationSelected: mainNavProviders.updateIndex,
                selectedIndex: mainNavProviders.selectedIndex,
                destinations: [
                  NavigationDestination(
                      icon: Icon(Icons.home),
                      label: "Home"),
                  NavigationDestination(
                      icon: Icon(Icons.dashboard),
                      label: "Categories"),
                  NavigationDestination(
                      icon: Icon(Icons.shopping_cart),
                      label: "Cart"),
                  NavigationDestination(
                      icon: Icon(Icons.favorite_border_outlined),
                      label: "Wishlist"),
                ]),
        );
      }
    );
  }
}
