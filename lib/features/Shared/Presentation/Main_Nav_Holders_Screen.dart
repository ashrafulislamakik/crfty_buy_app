import 'package:crfty_buy/features/Shared/Presentation/providers/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavHoldersScreen extends StatefulWidget {
  const MainNavHoldersScreen({super.key});

  static const String name = "/main-nav-holder";

  @override
  State<MainNavHoldersScreen> createState() => _MainNavHoldersScreenState();
}

class _MainNavHoldersScreenState extends State<MainNavHoldersScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(
      builder: (context,mainNavProviders,_) {
        return Scaffold(
          body: SizedBox(),
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
