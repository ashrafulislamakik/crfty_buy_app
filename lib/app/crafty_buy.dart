import 'package:crfty_buy/app/app_routs.dart';
import 'package:crfty_buy/app/app_theme.dart';
import 'package:crfty_buy/app/provider/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../features/Shared/Presentation/providers/main_nav_provider.dart';
import '../features/home/Presentation/providers/home_slider_providers.dart';




class craftybuyapp extends StatelessWidget {
  const craftybuyapp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> Languageprovider()),
        ChangeNotifierProvider(create: (context)=> MainNavProvider()),
        ChangeNotifierProvider(create: (context)=> HomeSliderProviders()),
      ],
      child:

      Consumer<Languageprovider>(
          builder: (context,languageprovider,child) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(create:(context) => languageprovider),
              ],
              child: Consumer<Languageprovider>(
                builder: (context,languageprovider,child) {
                  return MaterialApp(
                    navigatorKey: navigatorKey,
                    localizationsDelegates:  [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],

                    initialRoute: "/",
                    onGenerateRoute: AppRouter.onGenerateRoute,
                    theme: apptheme.lightTheme,
                    darkTheme: apptheme.darkTheme,
                    locale: languageprovider.currentlocale,
                    supportedLocales: languageprovider.supportedlocales,
                    themeMode: ThemeMode.light,
                  );
                }
              ),
            );
          }
      ),
    );

  }


}




